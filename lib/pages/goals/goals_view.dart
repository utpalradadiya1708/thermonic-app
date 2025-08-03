import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/color_constants.dart';
import 'goals_controller.dart';

class GoalsView extends GetView<GoalsController> {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      color: ColorConstants.secondaryColor,
      child: Column(),
    );
  }
}
