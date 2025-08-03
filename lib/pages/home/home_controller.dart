import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/models/home_model_response/home_model_response.dart';
import 'package:thermonic/models/subject_model_response/subject_model_response.dart';

import '../../core/common/constants/storage_keys.dart';
import '../../core/common/repository/apis/home_repository.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/repository/network_connectivity/connection_manager.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/services/api_service/configs.dart';
import '../../models/exam_model_response/exam_model_response.dart';
import '../../models/user_model_response/user_model_response.dart';
import '../../utils/helper/session_manager.dart';
import '../../utils/logger_util.dart';

class HomeController extends GetxController {
  final RxnInt selectedGrade = RxnInt();
  final isGuest = false.obs;
  final user = Rxn<UserModelResponse>();
  final List<int> allGrades = [6, 7, 8, 9, 10, 11, 12];
  final searchTextController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  LocalDataSource localDataSource = getIt<LocalDataSource>();
  final RxnInt selectedStream = RxnInt(); // allows null safely
  var searchText = ''.obs;

  String get selectedStreamName {
    return gradeList
            .firstWhereOrNull((g) => g.id == selectedGrade.value)
            ?.streams
            ?.firstWhereOrNull((s) => s.id == selectedStream.value)
            ?.name ??
        '';
  }

  final connectionController = Get.find<ConnectionController>();

  HomeRepository homeRepository = getIt<HomeRepository>();
  final ScrollController scrollController = ScrollController();

  final RxList<GradeModel> gradeList = <GradeModel>[].obs;
  RxBool isStreamVisible = false.obs;

  final selectedItem = RxnString();
  final isShimmerShow = true.obs;
  RxBool hasApiFailed = false.obs;

  final isSubjectListLoading = true.obs;
  final homeResponse = Rx<HomeModelResponse?>(null);
  final subjectList = Rx<List<SubjectModelResponse>>([]);
  final examsList = Rx<List<ExamModelResponse>>([]);

  void setSelected(String value) {
    selectedItem.value = value;
  }

  @override
  void onInit() {
    super.onInit();

    _loadSession();
    loadGrades();

    ever(connectionController.onInternetConnected, (connected) {
      if (connected == true && homeResponse.value == null) {
        getHomeData(isInitialLoad: true);
      }
    });

    _initializeUserData().then((_) async {
      if (connectionController.onInternetConnected.value) {
        await getHomeData(isInitialLoad: true);
      }
    });

    searchTextController.addListener(() {
      searchText.value = searchTextController.value.text;
    });
  }

  Future<void> refreshUser() async {
    final session = await SessionManager.getSessionState();
    isGuest.value = session.isGuest;
    user.value = session.user;
  }

  Future<void> _initializeUserData() async {
    final session = await SessionManager.getSessionState();
    final userGradeData = await SessionManager.getUserGradeData();

    final localGradeId = userGradeData['selected_grade'];
    final localStreamId = userGradeData['selected_stream'];

    if (session.user != null) {
      if (localGradeId != null && gradeList.any((g) => g.id == localGradeId)) {
        selectedGrade.value = localGradeId;
      } else {
        selectedGrade.value = gradeList.isNotEmpty ? gradeList.first.id : 1;
      }

      final grade = gradeList.firstWhereOrNull((g) => g.id == selectedGrade.value);
      isStreamVisible.value = grade?.streams?.isNotEmpty ?? false;

      if (isStreamVisible.value && localStreamId != null && grade!.streams!.any((s) => s.id == localStreamId)) {
        selectedStream.value = localStreamId;
      } else {
        selectedStream.value = (grade?.streams?.isNotEmpty ?? false) ? grade!.streams!.first.id : 0;
      }

      await SessionManager.saveSelectedGradeLocally(selectedGrade: selectedGrade.value ?? 1, selectedStream: selectedStream.value ?? 0);
    } else {
      // User is guest
      final GradeModel? defaultGrade = gradeList.isNotEmpty ? gradeList.first : null;

      if (defaultGrade != null) {
        selectedGrade.value = defaultGrade.id ?? 1;
        isStreamVisible.value = defaultGrade.streams?.isNotEmpty ?? false;

        if (isStreamVisible.value) {
          selectedStream.value = defaultGrade.streams!.first.id!;
        } else {
          selectedStream.value = 0;
        }

        await SessionManager.saveSelectedGradeLocally(selectedGrade: selectedGrade.value ?? 1, selectedStream: selectedStream.value ?? 0);
      } else {
        // fallback if gradeList is empty
        selectedGrade.value = 1;
        selectedStream.value = 0;
      }
    }
  }

  List<StreamModel> get selectedGradeStreams {
    return gradeList.firstWhereOrNull((g) => g.id == selectedGrade.value)?.streams ?? [];
  }

  String get selectedGradeName {
    return gradeList.firstWhereOrNull((g) => g.id == selectedGrade.value)?.name ?? 'testt';
  }

  Future<void> loadGrades() async {
    try {
      final storedJsonString = await localDataSource.getData(StorageKeys.cKeyGrades);
      if (storedJsonString != null) {
        final List<dynamic> jsonList = jsonDecode(storedJsonString);
        final grades = jsonList.map((e) => GradeModel.fromJson(e as Map<String, dynamic>)).toList();
        gradeList.assignAll(grades);
      }
    } catch (e) {
      MyLogger.e('Error loading grades: $e');
    }
  }

  Future<void> getHomeData({bool isInitialLoad = false, bool isGradeChange = false}) async {
    if (isInitialLoad) {
      isShimmerShow.value = true;
    }

    if (isGradeChange) {
      isSubjectListLoading.value = true;
    }

    final Map<String, dynamic> params = {ApiParamKey.gradeId: selectedGrade.value};

    final session = await SessionManager.getSessionState();
    if (session.user != null) {
      params[ApiParamKey.userId] = user.value?.user.id;
    }

    // ✅ Check if selected grade has streams
    final selectedGradeModel = gradeList.firstWhereOrNull((g) => g.id == selectedGrade.value);

    final hasStreams = (selectedGradeModel?.streams?.isNotEmpty ?? false);

    if (hasStreams && selectedStream.value != 0) {
      params[ApiParamKey.streamId] = selectedStream.value;
    }

    final response = await homeRepository.doHomeData(params);

    await response.fold(
      (failure) {
        isShimmerShow.value = false;
        isSubjectListLoading.value = false;
        hasApiFailed.value = true;
        CommonComponents.displaySnackBarError(failure.message);
      },
      (response) async {
        hasApiFailed.value = false;
        if (response.status) {
          homeResponse.value = HomeModelResponse.fromJson(response.data);
          subjectList.value.assignAll(homeResponse.value?.subjects ?? []);
          examsList.value.assignAll(homeResponse.value?.exams ?? []);
          gradeList.value = homeResponse.value?.grades ?? [];
          final count = homeResponse.value?.notificationCount ?? 0;
        } else {
          // homeResponse.value = null;
          subjectList.value = [];
          examsList.value = [];
          CommonComponents.displaySnackBarError(response.message);
        }
        isShimmerShow.value = false;
        isSubjectListLoading.value = false;
      },
    );
  }

  Future<void> onGradeChanged(int newGrade) async {
    print('[onGradeChanged] Called with newGrade: $newGrade');
    print('[onGradeChanged] Current selectedGrade: ${selectedGrade.value}');

    if (selectedGrade.value != newGrade) {
      print('[onGradeChanged] Grade changed, proceeding...');

      selectedGrade.value = newGrade;

      // Find selected grade model
      final selectedGradeModel = gradeList.firstWhereOrNull((g) => g.id == newGrade);

      print('[onGradeChanged] selectedGradeModel: $selectedGradeModel');

      // Handle stream logic
      if (selectedGradeModel?.streams?.isNotEmpty ?? false) {
        final firstStreamId = selectedGradeModel!.streams!.first.id!;
        selectedStream.value = firstStreamId;
        await localDataSource.setData('selected_stream', firstStreamId);
        print('[onGradeChanged] Stream available, set to: $firstStreamId');
        isStreamVisible.value = true;
      } else {
        selectedStream.value = 0;
        await localDataSource.clearSpecificKey('selected_stream');
        print('[onGradeChanged] No stream available, cleared selected_stream');
        isStreamVisible.value = false;
      }

      // Save locally
      await SessionManager.saveSelectedGradeLocally(selectedGrade: newGrade, selectedStream: selectedStream.value ?? 0);
      print('[onGradeChanged] Grade and Stream saved to session manager');

      // Fetch updated data
      await getHomeData(isGradeChange: true);
      print('[onGradeChanged] getHomeData() called');
    } else {
      print('[onGradeChanged] Grade is the same, no changes made.');
    }
  }

  Future<void> onStreamChanged(int newStreamId) async {
    if (selectedStream.value != newStreamId) {
      selectedStream.value = newStreamId;

      // Save streamId to local storage
      await localDataSource.setData('selected_stream', newStreamId);

      // Fetch updated data for the selected grade + stream
      await getHomeData(isGradeChange: true);
    }
  }

  Future<void> _loadSession() async {
    final session = await SessionManager.getSessionState();
    isGuest.value = session.isGuest;
    user.value = session.user;
  }
}
