import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../../theme/font_constants.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const StadiumBorder(),
    this.margin = const EdgeInsets.all(0),
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeOutQuint,
  });

  final List<CustomBottomBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? selectedColorOpacity;
  final ShapeBorder itemShape;
  final EdgeInsets margin;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final selectedColor = selectedItemColor ?? ColorConstants.whiteColor;
    final unselectedColor = unselectedItemColor ?? ColorConstants.greyColor;

    return SizedBox(
      // height: 100,
      child: LayoutBuilder(
        builder: (context, constraints) {
          const horizontalPadding = 15.0;
          final availableWidth = constraints.maxWidth - horizontalPadding * 2;
          final itemWidth = availableWidth / items.length;
          final indicatorWidth = itemWidth * 0.8;
          // final indicatorLeft =
          //     currentIndex * itemWidth +
          //     (itemWidth - indicatorWidth) / 2 +
          //     horizontalPadding;
          final isRTL = Directionality.of(context) == TextDirection.rtl;

          final indicatorLeft = isRTL
              ? // In RTL, start from right and move left
                constraints.maxWidth -
                    (currentIndex + 1) * itemWidth +
                    (itemWidth - indicatorWidth) / 2 -
                    horizontalPadding
              : // LTR default calculation
                currentIndex * itemWidth +
                    (itemWidth - indicatorWidth) / 2 +
                    horizontalPadding;

          return Container(
            padding: EdgeInsetsGeometry.only(bottom: 16),
            color: ColorConstants.secondaryButtonColor,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(items.length, (i) {
                      final item = items[i];
                      final isSelected = i == currentIndex;

                      return GestureDetector(
                        onTap: () => onTap?.call(i),
                        behavior: HitTestBehavior.opaque,
                        child: SizedBox(
                          width: itemWidth,
                          child: TweenAnimationBuilder<double>(
                            tween: Tween<double>(end: isSelected ? 1.0 : 0.0),
                            duration: duration,
                            curve: curve,
                            builder: (context, t, _) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 12),

                                  isSelected
                                      ? item.activeIcon ?? item.icon
                                      : IconTheme(
                                          data: IconThemeData(
                                            color: unselectedColor,
                                          ),
                                          child: item.icon,
                                        ),
                                  const SizedBox(height: 4),
                                  DefaultTextStyle(
                                    style: isSelected
                                        ? AppThemeState().textStyleRegular(
                                            selectedColor,
                                            fontSize: FontConstants.font_14,
                                          )
                                        : AppThemeState().textStyleRegular(
                                            unselectedColor,
                                            fontSize: FontConstants.font_14,
                                          ),
                                    child: item.title,
                                  ),
                                  // const SizedBox(height: 24),
                                ],
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutQuint,
                  top: 0,
                  left: indicatorLeft,
                  child: Container(
                    height: 1,
                    width: indicatorWidth,
                    decoration: BoxDecoration(
                      color: ColorConstants.primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomBottomBarItem {
  final Widget icon;
  final Widget? activeIcon;
  final Widget title;

  CustomBottomBarItem({
    required this.icon,
    required this.title,
    this.activeIcon,
  });
}
