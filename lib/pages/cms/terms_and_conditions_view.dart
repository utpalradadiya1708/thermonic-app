import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../core/common/widget/common_appbar.dart';
import '../../core/common/widget/common_background.dart';
import '../../core/theme/app_size_constants.dart';
import 'cms_controller.dart';

class TermsAndConditionsView extends GetView<CmsController> {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Column(
        children: [
          Obx(() => CommonAppBar(text: controller.appBarTitle.value)),
          Expanded(child: _buildContent(context)),
        ],
      ).paddingSymmetric(horizontal: AppSizeConstants.size_15),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Obx(() {
      return WebViewWidget(controller: controller.webViewController.value);
    });
  }
}
