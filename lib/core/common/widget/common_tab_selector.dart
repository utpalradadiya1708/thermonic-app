import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/controller/common_tab_controller.dart';
import 'package:thermonic/core/theme/app_theme.dart';
import 'package:thermonic/core/theme/color_constants.dart';
import 'package:thermonic/utils/widget_extensions.dart';

class CommonTabSelector extends StatelessWidget {
  final List<String> tabs;
  final CommonTabController commonTabController;
  final Function(int index)? onChanged;

  const CommonTabSelector({
    super.key,
    required this.tabs,
    required this.commonTabController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorConstants.secondaryButtonColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ColorConstants.borderColor),
        ),
        child: Row(
          children: [
            for (int index = 0; index < tabs.length; index++) ...[
              if (index > 0) 10.hBox, // Adds spacing only between tabs
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    commonTabController.selectIndex(index);
                    onChanged?.call(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: commonTabController.selectedIndex.value == index
                          ? ColorConstants.primaryColor
                          : ColorConstants.darkPurpleColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tabs[index].tr,
                      style: AppThemeState().textStyleRegular(
                        ColorConstants.whiteColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
