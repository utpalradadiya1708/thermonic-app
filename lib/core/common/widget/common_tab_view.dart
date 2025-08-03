import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/controller/common_tab_controller.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import 'common_tab_selector.dart';

class CommonTabView extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> views;
  final CommonTabController commonTabController;

  const CommonTabView({
    super.key,
    required this.tabs,
    required this.views,
    required this.commonTabController,
  });

  @override
  Widget build(BuildContext context) {
    assert(tabs.length == views.length, "Tabs and views must match in length");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTabSelector(tabs: tabs, commonTabController: commonTabController),
        16.vBox,
        Obx(() => views[commonTabController.selectedIndex.value]),
      ],
    );
  }
}
