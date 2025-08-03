import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/logger_util.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/enum/otp_type.dart';
import '../../core/common/repository/apis/auth_repository.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/services/api_service/configs.dart';
import '../../models/user_model_response/user_model_response.dart';
import '../../utils/helper/session_manager.dart';
import '../login/login_controller.dart';

class OtpController extends GetxController {
  AuthRepository authRepository = getIt<AuthRepository>();
  LocalDataSource localDataSource = getIt<LocalDataSource>();
  final loginController = Get.find<LoginController>();

  Map<String, String> params = {};
  OtpType? isFrom;
  String? mobileNumber;
  String? countryCode;
  int? otpReceived;
  Timer? timer;
  final secondsRemaining = 0.obs;

  // final isTimerRunning = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      mobileNumber = Get.arguments[ArgumentsConst.mobileNumber];
      otpReceived = Get.arguments[ArgumentsConst.otp];
      countryCode = Get.arguments[ArgumentsConst.countryCode] ?? '965';
    }
    startTimer();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    timer = null;
    super.onClose();
  }

  void startTimer() {
    // if (!isTimerRunning.value) {
    //   isTimerRunning.value = true;
    timer?.cancel();
    timer = null;
    secondsRemaining.value = 30;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining > 0) {
        secondsRemaining.value--;
      } else {
        secondsRemaining.value = 0;
        timer?.cancel();
        timer = null;
        // isTimerRunning.value = false;
      }
    });
    // }
  }

  Future<bool> onSubmitButtonClick(String otp) async {
    if (otp.isEmpty || otp.length < 6) {
      CommonComponents.displaySnackBarError('lblPleaseEnterOTP'.tr);
      return false;
    } else if (int.tryParse(otp) != otpReceived) {
      CommonComponents.displaySnackBarError('lblPleaseEnterValidOTP'.tr);
      return false;
    } else {
      await doLogin();
      return true;
    }
  }

  void onResendOtp() async {
    await loginController.sendOtp(mobileNumber ?? '', resent: "1");
  }

  Future<void> doLogin() async {
    EasyLoading.show();
    // FirebaseMessaging.instance.getToken().then((token) async {
    String platform = "";
    String deviceName = "";

    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceName = "${androidInfo.manufacturer} ${androidInfo.model}";
      platform = "android";
    } else {
      final iosInfo = await deviceInfo.iosInfo;
      deviceName = "${iosInfo.name} ${iosInfo.model}";
      platform = "ios";
    }

    // params[ApiParamKey.deviceToken] = token ?? '';
    params[ApiParamKey.deviceToken] =
        'and2-9qlpQ:APA91bGhzl_FUxwSJOEM5_iBt6mjhkeYd1uXw5PmnYAb6pmCnus1q10iVdnCCBufblOjuOg7H-m6nq73SaCuCykgA0CCzDOpJ-i0RM2CjmrbXVb8KFerOauq8pxV6tuzF8h7v4Hy7mUp';
    params[ApiParamKey.deviceType] = platform;
    params[ApiParamKey.deviceName] = deviceName;
    params[ApiParamKey.phone] = mobileNumber ?? '';

    final response = await authRepository.doLogin(params);

    await response.fold(
      (failure) {
        EasyLoading.dismiss();
        CommonComponents.displaySnackBarError(failure.message);
      },
      (response) async {
        EasyLoading.dismiss();
        if (response.status) {
          MyLogger.log("RESPONSE: ${response.data}");

          UserModelResponse userModelResponse = UserModelResponse.fromJson(response.data);

          // Use SessionManager for login
          await SessionManager.loginUser(userModelResponse);

          // Navigate based on profile setup status
          if (userModelResponse.user.isProfileSetup == true) {
            Get.offAllNamed(Routes.dashboard);
          } else {
            Get.offAllNamed(Routes.profileSetup, arguments: {ArgumentsConst.mobileNumber: mobileNumber});
          }
        } else {
          CommonComponents.displaySnackBarError(response.message);
        }
      },
    );
    // });
  }
}
