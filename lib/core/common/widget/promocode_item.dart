import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../constants/image_constants.dart';

class PromoCodeItem extends StatelessWidget {
  final String discountText;
  final String code;
  final String description;
  final String expiryDate;
  final String type;
  final VoidCallback onApplyTap;
  final bool isApplied;
  final VoidCallback? onRemoveTap;

  const PromoCodeItem({
    super.key,
    required this.discountText,
    required this.code,
    required this.description,
    required this.expiryDate,
    required this.onApplyTap,
    required this.type,
    this.isApplied = false,
    this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Stack(
      children: [
        Image.asset(ImageConstants.icPromoCode, matchTextDirection: true),
        Positioned.fill(
          child: Row(
            children: [
              Transform.rotate(
                angle: isRTL ? pi / 2 : -pi / 2,
                child: Text(
                  getDiscountText(type, discountText),
                  style: AppThemeState().textStyleBold(
                    ColorConstants.whiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    bottom: 16,
                    right: isRTL ? 20 : 16,
                    left: isRTL ? 16 : 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        code,
                        style: AppThemeState().textStyleBold(
                          ColorConstants.promoCodeTitleColor,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        description,
                        maxLines: 2,
                        style: AppThemeState().textStyleMedium(
                          ColorConstants.greyColor,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'lblExpires'.tr,
                                style: AppThemeState().textStyleMedium(
                                  ColorConstants.greyColor,
                                  fontSize: 10,
                                ),
                              ),
                              2.vBox,
                              Text(
                                expiryDate,
                                style: AppThemeState().textStyleBold(
                                  ColorConstants.whiteColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          // Fix 1: Add GestureDetector with proper hit test behavior
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (isApplied) {
                                onRemoveTap?.call();
                              } else {
                                onApplyTap();
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                color: isApplied
                                    ? ColorConstants.transparentColor
                                    : ColorConstants.primaryColor,
                                border: Border.all(
                                  color: isApplied
                                      ? ColorConstants.primaryColor
                                      : ColorConstants.transparentColor,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                isApplied ? 'lblRemove'.tr : 'lblApply'.tr,
                                style: AppThemeState().textStyleMedium(
                                  ColorConstants.whiteColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getDiscountText(String type, String discountAmount) {
    if (type == "percentage") {
      return "${discountAmount.split('.').first}% OFF";
    } else {
      return "₹${discountAmount.split('.').first} OFF";
    }
  }
}
