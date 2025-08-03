import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/common/widget/common_appbar.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/theme/app_size_constants.dart';
import 'cms_controller.dart';

class PrivacyPolicyView extends GetView<CmsController> {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Column(
        children: [
          CommonAppBar(text: 'lblPrivacyPolicy'.tr),
          Expanded(
            child: Obx(
              () =>
                  WebViewWidget(controller: controller.webViewController.value),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: AppSizeConstants.size_15),
    );
  }
}
