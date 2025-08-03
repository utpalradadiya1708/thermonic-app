import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/constants/app_constants.dart';
import 'package:thermonic/core/common/widget/common_components.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';

// Generic interface for course items
abstract class CourseItem {
  String? get name;
  String? get image;
  dynamic get id;
}

class GenericCoursePackageGrid<T extends CourseItem> extends StatelessWidget {
  final List<T> items;
  final bool isGrid;
  final void Function(T item)? onTap;

  const GenericCoursePackageGrid({
    super.key,
    required this.items,
    this.onTap,
    this.isGrid = true,
  });

  @override
  Widget build(BuildContext context) {
    return isGrid
        ? GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              final gradient =
                  AppConstants.gradients[index % AppConstants.gradients.length];
              return GestureDetector(
                onTap: () => onTap?.call(item),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonComponents.getNetworkImageViewAPI(
                        item.image ?? '',
                        height: 90,
                        boxFit: BoxFit.contain,
                      ),
                      14.vBox,
                      Text(
                        item.name ?? '',
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.blackColor2,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : Align(
            alignment: Get.locale?.languageCode == 'ar'
                ? Alignment.topRight
                : Alignment.topLeft,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final gradient = AppConstants
                    .gradients[index % AppConstants.gradients.length];

                return GestureDetector(
                  onTap: () => onTap?.call(item),
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: index == items.length - 1 ? 16 : 0,
                    ),
                    child: Container(
                      width: 166,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: gradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonComponents.getNetworkImageViewAPI(
                            item.image ?? '',
                            height: 90,
                            boxFit: BoxFit.contain,
                          ),
                          14.vBox,
                          Text(
                            item.name ?? '',
                            style: AppThemeState().textStyleRegular(
                              ColorConstants.blackColor2,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return 12.hBox;
              },
            ),
          );
  }
}
