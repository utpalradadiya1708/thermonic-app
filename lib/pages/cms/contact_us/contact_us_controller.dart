import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common/repository/apis/common_repository.dart';
import '../../../core/di/injector_container.dart';

class ContactUsController extends GetxController {
  CommonRepository commonRepository = getIt<CommonRepository>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController editFullName = TextEditingController();
  final TextEditingController editEmail = TextEditingController();
  final TextEditingController editMobileNumber = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final FocusNode focusFullName = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusMobileNumber = FocusNode();
  final FocusNode messageFocus = FocusNode();

  @override
  void onInit() {
    // setUserData();
    super.onInit();
  }

  // Future<void> setUserData() async {
  //   UserModelResponseResponseResponse UserModelResponseResponseResponse = UserModelResponseResponseResponse.fromJson(
  //     await getIt<LocalDataSource>().getData(StorageKeys.cKeyUserData),
  //   );
  //   editFullName.text = UserModelResponseResponseResponse.name;
  //   editEmail.text = UserModelResponseResponseResponse.email;
  //   editMobileNumber.text = UserModelResponseResponseResponse.mobileNumber;
  // }

  /*  Future<void> doContactUs() async {
    EasyLoading.show();
    Map<String, String> params = {
      ApiParamKey.fullName: editFullName.text.trim(),
      ApiParamKey.email: editEmail.text.trim(),
      ApiParamKey.mobileNo: editMobileNumber.text.trim(),
      ApiParamKey.message: messageController.text.trim(),
    };

    final response = await commonRepository.doContactUs(params);

    response.fold(
      (failure) {
        EasyLoading.dismiss();
        CommonComponents.displaySnackBarError(failure.message);
      },
      (response) {
        EasyLoading.dismiss();
        if (response.status) {
          Get.back();
          CommonComponents.displaySnackBarSuccess(response.message);
        } else {
          CommonComponents.displaySnackBarError(response.message);
        }
      },
    );
  }*/
}
