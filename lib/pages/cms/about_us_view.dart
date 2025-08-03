// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:maridady_motors_team_kv/core/common/constants/string_constants.dart';
// import 'package:maridady_motors_team_kv/core/common/widget/common_appbar.dart';
// import 'package:maridady_motors_team_kv/core/common/widget/common_background.dart';
// import 'package:maridady_motors_team_kv/core/theme/app_size_constants.dart';
// import 'package:maridady_motors_team_kv/pages/cms/cms_controller.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class AboutUsView extends GetView<CmsController> {
//   const AboutUsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CommonBackground(
//       child: Column(
//         children: [
//           CommonAppBar(text: StringConstants.lblAboutUs),
//           Expanded(
//             child: Obx(
//               () =>
//                   WebViewWidget(controller: controller.webViewController.value),
//             ),
//           ),
//         ],
//       ).paddingSymmetric(horizontal: AppSizeConstants.size_15),
//     );
//   }
// }
