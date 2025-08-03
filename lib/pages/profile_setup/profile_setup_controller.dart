import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:path/path.dart' as p;

import '../../core/common/constants/app_constants.dart';
import '../../core/common/constants/storage_keys.dart';
import '../../core/common/repository/apis/auth_repository.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/services/api_service/configs.dart';
import '../../models/user_model_response/user_model_response.dart';
import '../../utils/helper/session_manager.dart';
import '../../utils/logger_util.dart';

class ProfileSetupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  AuthRepository authRepository = getIt<AuthRepository>();

  final RxList<GradeModel> gradeList = <GradeModel>[].obs;
  final Rx<UserData?> userData = Rx<UserData?>(null);

  final TextEditingController editConEmail = TextEditingController();
  final TextEditingController editConPass = TextEditingController();
  final TextEditingController editConConfirmPass = TextEditingController();
  final TextEditingController editConFullName = TextEditingController();
  final TextEditingController editConMobileNumber = TextEditingController();

  LocalDataSource localDataSource = getIt<LocalDataSource>();

  final scrollController = ScrollController();
  var streamSectionKey = GlobalKey();

  final FocusNode focusMobileNumber = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();
  final FocusNode focusFullName = FocusNode();

  final RxInt selectedGrade = 0.obs;
  final RxInt selectedStreamId = 0.obs;
  final List<int> allGrades = [6, 7, 8, 9, 10, 11, 12];

  RxString selectedPath = ''.obs;
  RxString networkImageUrl = ''.obs;

  String? mobileNumber;
  bool? isFromEditProfile;

  @override
  void onInit() {
    super.onInit();
    _initializeFromArguments();
    _initializeUserData();
    loadGrades();
    loadGradesFromLocal();
  }

  void _initializeFromArguments() {
    if (Get.arguments != null) {
      isFromEditProfile = Get.arguments[ArgumentsConst.isFromEditProfile] ?? false;
      mobileNumber = Get.arguments[ArgumentsConst.mobileNumber] ?? '';
      editConMobileNumber.text = mobileNumber ?? '';
    }
  }

  void _initializeUserData() async {
    final session = await SessionManager.getSessionState();
    if (session.user != null) {
      final user = session.user!.user;
      editConEmail.text = user.email ?? '';
      editConFullName.text = user.name ?? '';
      editConMobileNumber.text = user.phone ?? '';
      // selectedGrade.value = user.gradeId ?? 0;

      if (user.profilePictureFullUrl?.isNotEmpty == true) {
        networkImageUrl.value = user.profilePictureFullUrl!;
        selectedPath.value = '';
      }
    }
  }

  Future<bool> hasProfileChanged() async {
    final session = await SessionManager.getSessionState();
    final sessionUser = session.user?.user;

    if (sessionUser == null) return true;

    final nameChanged = editConFullName.text.trim() != (sessionUser.name?.trim() ?? '');
    final emailChanged = editConEmail.text.trim() != (sessionUser.email?.trim() ?? '');
    final gradeChanged = selectedGrade.value != (sessionUser.gradeId ?? 0);
    final streamChanged = (_getSelectedGradeModel()?.requiresStreamSelection ?? false)
        ? selectedStreamId.value != (sessionUser.streamId ?? 0)
        : false;
    final imageChanged = hasSelectedNewLocalImage();

    return nameChanged || emailChanged || gradeChanged || streamChanged || imageChanged;
  }

  void onGradeChanged() {
    final selectedGradeModel = _getSelectedGradeModel();
    final requiresStream = selectedGradeModel?.requiresStreamSelection ?? false;

    selectedStreamId.value = 0;

    if (requiresStream) {
      Future.delayed(const Duration(milliseconds: 500), () {
        final ctx = streamSectionKey.currentContext;
        if (ctx != null) {
          Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 400));
        }
      });
    }
  }

  Future<void> completeProfileSetup({bool isRefresh = false}) async {
    if (!isRefresh) return;

    try {
      EasyLoading.show();
      final formData = await _buildFormData(isRefresh: isRefresh);

      final response = await authRepository.doProfileSetup(formData);

      await response.fold((failure) => CommonComponents.displaySnackBarError(failure.message), (res) async {
        if (res.status) {
          final userModel = UserModelResponse.fromJson(res.data);
          await SessionManager.loginUser(userModel);
          await updateLocalGradeAndStreamIfChanged(userModel);
          await SessionManager.updateProfileSetupStatus(true);

          if (isRefresh) {
            await _saveSelectedGradeLocally();
            await refreshUserData();
            await loadGrades();
          } else {
            await _saveSelectedGradeLocally();
            if (isFromEditProfile ?? false) {
              Get.back();
              CommonComponents.displaySnackBarSuccess(res.message);
            } else {
              Get.offAllNamed(Routes.dashboard);
            }
          }

          // if (!isRefresh) {
          //   await _saveSelectedGradeLocally();
          //   if (isFromEditProfile ?? false) {
          //     Get.back();
          //     CommonComponents.displaySnackBarSuccess(res.message);
          //   } else {
          //     Get.offAllNamed(Routes.dashboard);
          //   }
          // }
        } else {
          CommonComponents.displaySnackBarError(res.message);
        }
      });
    } catch (e) {
      CommonComponents.displaySnackBarError('An error occurred during profile setup');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> updateLocalGradeAndStreamIfChanged(UserModelResponse model) async {
    final serverGrade = model.user.gradeId ?? 0;
    final serverStream = model.user.streamId ?? 0;

    final localGrade = await localDataSource.getData('selected_grade');
    final localStream = await localDataSource.getData('selected_stream');

    bool shouldUpdate = false;

    if (localGrade != serverGrade) {
      await localDataSource.setData('selected_grade', serverGrade);
      selectedGrade.value = serverGrade;
      shouldUpdate = true;
    }

    if (serverStream != 0 && localStream != serverStream) {
      await localDataSource.setData('selected_stream', serverStream);
      selectedStreamId.value = serverStream;
      shouldUpdate = true;
    }

    if (shouldUpdate) {
      MyLogger.i('Local grade/stream updated based on server changes.');
    }
  }

  Future<void> updateGradesAndStreams() async {
    try {
      EasyLoading.show();
      final formData = await _buildFormData();

      final response = await authRepository.doProfileSetup(formData);

      await response.fold((failure) => CommonComponents.displaySnackBarError(failure.message), (res) async {
        if (res.status) {
          await SessionManager.loginUser(UserModelResponse.fromJson(res.data));
          await SessionManager.updateProfileSetupStatus(true);
          await _saveSelectedGradeLocally();
        } else {
          CommonComponents.displaySnackBarError(res.message);
        }
      });
    } catch (e) {
      CommonComponents.displaySnackBarError('An error occurred during profile setup');
    } finally {
      EasyLoading.dismiss();
    }
  }

  bool _validateForm() {
    if (selectedGrade.value == 0) {
      CommonComponents.displaySnackBarError('lblPleaseSelectGrade'.tr);
      return false;
    }

    if (_getSelectedGradeModel()?.requiresStreamSelection == true && selectedStreamId.value == 0) {
      CommonComponents.displaySnackBarError('lblPleaseSelectStream'.tr);
      return false;
    }

    return true;
  }

  Future<FormData> _buildFormData({bool isRefresh = false}) async {
    if (isRefresh) return FormData();

    final formMap = <String, dynamic>{};

    final name = editConFullName.text.trim();
    if (name.isNotEmpty) formMap[ApiParamKey.name] = name;

    final phone = editConMobileNumber.text.trim();
    if (phone.isNotEmpty) formMap[ApiParamKey.phone] = phone;

    final email = editConEmail.text.trim();
    if (email.isNotEmpty) formMap[ApiParamKey.email] = email;

    final password = editConPass.text.trim();
    if (password.isNotEmpty) formMap[ApiParamKey.password] = password;

    if (selectedGrade.value != 0) {
      formMap[ApiParamKey.gradeId] = selectedGrade.value;
    }

    if (_getSelectedGradeModel()?.requiresStreamSelection == true && selectedStreamId.value != 0) {
      formMap[ApiParamKey.streamId] = selectedStreamId.value;
    }

    final formData = FormData.fromMap(formMap);

    if (hasSelectedNewLocalImage()) {
      final fileName = selectedPath.value.split('/').last;
      final extension = p.extension(selectedPath.value).replaceAll('.', '');
      formData.files.add(
        MapEntry(
          ApiParamKey.profilePicture,
          await MultipartFile.fromFile(selectedPath.value, filename: fileName, contentType: DioMediaType('image', extension)),
        ),
      );
    }

    return formData;
  }

  Future<void> _saveSelectedGradeLocally() async {
    print('latest stream ${selectedStreamId.value}');
    await localDataSource.setData('selected_grade', selectedGrade.value);
    await localDataSource.setData('selected_stream', selectedStreamId.value);
  }

  GradeModel? _getSelectedGradeModel() {
    return gradeList.firstWhereOrNull((g) => g.id == selectedGrade.value);
  }

  bool hasSelectedNewLocalImage() => selectedPath.value.isNotEmpty;

  bool hasNetworkImage() => networkImageUrl.value.isNotEmpty;

  String getCurrentImagePath() {
    if (hasSelectedNewLocalImage()) return selectedPath.value;
    if (hasNetworkImage()) return networkImageUrl.value;
    return '';
  }

  void clearSelectedData() {
    selectedGrade.value = 0;
    selectedStreamId.value = 0;
    selectedPath.value = '';
    networkImageUrl.value = '';
  }

  Future<void> refreshUserData() async {
    final session = await SessionManager.getSessionState();
    if (session.user != null) _initializeUserData();
  }

  Future<void> loadGrades() async {
    try {
      final storedJsonString = await localDataSource.getData(StorageKeys.cKeyGrades);
      if (storedJsonString != null) {
        final List<dynamic> jsonList = jsonDecode(storedJsonString);
        final grades = jsonList.map((e) => GradeModel.fromJson(e)).toList();
        gradeList.assignAll(grades);
      }
    } catch (e) {
      MyLogger.e('Error loading grades: $e');
    }
  }

  void loadGradesFromLocal() async {
    try {
      final gradeData = await localDataSource.getData('selected_grade');
      if (gradeData is int) selectedGrade.value = gradeData;

      final streamId = await localDataSource.getData('selected_stream');
      if (streamId is int) selectedStreamId.value = streamId;
    } catch (e) {
      MyLogger.e('Error loading local grade/stream: $e');
    }
  }

  @override
  void onClose() {
    editConEmail.dispose();
    editConFullName.dispose();
    editConMobileNumber.dispose();
    focusMobileNumber.dispose();
    focusEmail.dispose();
    focusFullName.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
