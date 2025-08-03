import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/repository/apis/auth_repository.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../core/services/api_service/configs.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  AuthRepository authRepository = getIt<AuthRepository>();
  LocalDataSource localDataSource = getIt<LocalDataSource>();
  final isTermsAndConditionSelected = false.obs;

  final TextEditingController editConMobileNumber = TextEditingController();
  final TextEditingController editConEmail = TextEditingController();
  final TextEditingController editConPassword = TextEditingController();

  final FocusNode focusMobileNumber = FocusNode();
  final FocusNode focusEmail= FocusNode();
  final FocusNode focusPassword = FocusNode();
  final isPasswordObscureText = true.obs;
  final isMobileNumberEnter = false.obs;
  final isEmailEnter = false.obs;

  Future<void> onGetLogin() async {
  /*  if (!isTermsAndConditionSelected.value) {
      CommonComponents.displaySnackBarError('lblAgreeTermsAndConditions'.tr);
      return;
    }*/

    final otp = await sendOtp(editConMobileNumber.text.trim());

    if (otp != null) {
      Get.toNamed(
        Routes.profileSetup,
        arguments: {
          ArgumentsConst.mobileNumber: editConMobileNumber.text.trim(),
          ArgumentsConst.countryCode: '965',
          ArgumentsConst.otp: otp,
        },
      );
    }
  }

  Future<int?> sendOtp(String mobileNumber, {String? resent}) async {
    EasyLoading.show();

    try {
      final params = {ApiParamKey.phone: mobileNumber};
      if (resent != null) {
        params.addAll({ApiParamKey.resent: resent});
      }
      final response = await authRepository.doSendOtp(params);

      int? otpCode;

      await response.fold(
        (failure) {
          EasyLoading.dismiss();
          CommonComponents.displaySnackBarError(failure.message);
        },
        (response) async {
          EasyLoading.dismiss();
          if (response.status) {
            otpCode = response.data[ArgumentsConst.otp];
            CommonComponents.displaySnackBarSuccess(
              '${response.message} $otpCode',
            );
          } else {
            CommonComponents.displaySnackBarError(response.message);
          }
        },
      );

      return otpCode;
    } catch (e) {
      EasyLoading.dismiss();
      CommonComponents.displaySnackBarError("Something went wrong");
      return null;
    }
  }
}
