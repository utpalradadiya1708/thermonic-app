import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/widget/drop_down/dropdown_button2.dart';
import 'package:thermonic/core/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/common/constants/app_constants.dart';
import '../../core/common/repository/apis/common_repository.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';

class CmsController extends GetxController {
  CommonRepository commonRepository = getIt<CommonRepository>();

  ///FAQ
  final expandedIndex = (-1).obs;
  final faqList = Rx<List<Map<String, dynamic>>>([]);

  final isLoading = false.obs;

  final webViewController = WebViewController().obs;

  String url = "";
  late CourseType courseType;
  final referralCode = "".obs;
  final referralDes = "".obs;
  final appBarTitle = "".obs;
  final isWebViewLoading = true.obs;
  String? price;

  String? language = Get.locale?.languageCode ?? 'en';

  @override
  void onInit() {
    if (Get.arguments != null) {
      int type = Get.arguments[ArgumentsConst.isFrom];
      price = Get.arguments[ArgumentsConst.price] ?? '';
      url = Get.arguments[ArgumentsConst.paymentUrl] ?? '';
      courseType =
          Get.arguments[ArgumentsConst.courseType] ?? CourseType.examPackage;
      if (type == 1) {
        url = '${AppConstants.termsConditions}/$language';
        appBarTitle.value = 'lblTermsOfService'.tr;
      } else if (type == 2) {
        url = '${AppConstants.privacyPolicy}/$language';
        appBarTitle.value = 'lblPrivacyPolicy'.tr;
      } else if (type == 3) {
        url = '${AppConstants.aboutUs}/$language';
        appBarTitle.value = 'lblAboutUs'.tr;
      } else if (type == 4) {
        appBarTitle.value = 'lblFAQ'.tr;
        getFaq();
      } else if (type == 5) {
        appBarTitle.value = ''.tr;
      }

      if (url.isNotEmpty) {
        webViewController.value = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          // ..setBackgroundColor(ColorConstants.whiteColor)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (String url) {
                EasyLoading.show();
              },
              onPageFinished: (String url) {
                EasyLoading.dismiss();
              },
              onNavigationRequest: (NavigationRequest request) {
                final url = request.url.toLowerCase();

                if (url.contains("payment/success")) {
                  EasyLoading.dismiss();
                  Get.back();
                  Get.offAllNamed(
                    Routes.paymentSuccess,
                    arguments: {
                      ArgumentsConst.courseType: courseType,
                      ArgumentsConst.paymentStatus: true,
                      ArgumentsConst.price: price,
                    },
                  );
                  print('url $url');
                  CommonComponents.displaySnackBarSuccess(
                    'lblPaymentSuccessful'.tr,
                  );
                  return NavigationDecision.prevent;
                } else if (url.contains("payment/failed")) {
                  EasyLoading.dismiss();
                  Get.back();
                  Get.offAllNamed(
                    Routes.paymentSuccess,
                    arguments: {
                      ArgumentsConst.courseType: courseType,
                      ArgumentsConst.paymentStatus: false,
                      ArgumentsConst.price: price,
                    },
                  );
                  CommonComponents.displaySnackBarError('lblPaymentFailed'.tr);
                  return NavigationDecision.prevent;
                }

                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(url));
      }
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    if (url.isNotEmpty) {
      // Show loading immediately
      EasyLoading.show();
    }
  }

  @override
  void onClose() {
    EasyLoading.dismiss();
    super.onClose();
  }

  Future<void> getFaq() async {
    EasyLoading.show();
    final response = await commonRepository.getFAQ();

    await response.fold(
      (failure) {
        EasyLoading.dismiss();
        CommonComponents.displaySnackBarError(failure.message);
      },
      (response) async {
        EasyLoading.dismiss();
        if (response.status) {
          faqList.value = (response.data as List<dynamic>)
              .map((json) => json as Map<String, dynamic>)
              .toList();
        } else {
          CommonComponents.displaySnackBarError(response.message);
        }
      },
    );
  }
}
