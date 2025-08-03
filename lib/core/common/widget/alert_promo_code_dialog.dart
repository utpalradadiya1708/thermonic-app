import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/widget/promocode_item.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../../models/promo_code_model_response/promo_code_model_response.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import 'common_components.dart';
import 'common_textform_field.dart';

class ApplyPromoCodeDialog extends StatefulWidget {
  final List<PromoCodeModelResponse> promoCodes;
  final Function(String? code) onApply;
  final String? selectedCode;

  const ApplyPromoCodeDialog({
    super.key,
    required this.promoCodes,
    required this.onApply,
    this.selectedCode,
  });

  @override
  State<ApplyPromoCodeDialog> createState() => _ApplyPromoCodeDialogState();
}

class _ApplyPromoCodeDialogState extends State<ApplyPromoCodeDialog> {
  final TextEditingController codeController = TextEditingController();
  List<PromoCodeModelResponse> filteredPromoCodes = [];

  @override
  void initState() {
    super.initState();
    filteredPromoCodes = widget.promoCodes;
    codeController.addListener(_filterPromoCodes);
  }

  void _filterPromoCodes() {
    final query = codeController.text.trim().toLowerCase();

    setState(() {
      if (query.isEmpty) {
        filteredPromoCodes = widget.promoCodes;
      } else {
        filteredPromoCodes = widget.promoCodes
            .where(
              (promo) => promo.code?.toLowerCase().contains(query) ?? false,
            )
            .toList();
      }
    });
  }

  void _handleApply(String? input) {
    final code = input?.trim().toLowerCase();

    if (code == null || code.isEmpty) {
      widget.onApply(null);
      Get.back();
      return;
    }

    final matchedPromo = widget.promoCodes.firstWhereOrNull(
      (promo) => (promo.code?.toLowerCase() ?? '') == code,
    );

    if (matchedPromo != null) {
      widget.onApply(matchedPromo.code);
      Get.back();
    } else {
      CommonComponents.displaySnackBarError('lblNoPromoCode'.tr);
    }
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorConstants.secondaryButtonColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorConstants.borderColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            22.vBox,
            _buildTextField(),
            16.vBox,
            Flexible(
              child: filteredPromoCodes.isEmpty
                  ? Center(
                      child: Text(
                        'lblNoPromoCode'.tr,
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) => 16.vBox,
                      itemCount: filteredPromoCodes.length,
                      itemBuilder: (context, index) {
                        final promo = filteredPromoCodes[index];
                        return PromoCodeItem(
                          discountText: promo.discountAmount ?? '',
                          code: promo.code ?? '',
                          description: promo.description ?? '',
                          expiryDate: promo.expiryDate ?? '',
                          type: promo.type ?? '',
                          isApplied: promo.code == widget.selectedCode,
                          onApplyTap: () {
                            if (promo.code != widget.selectedCode) {
                              _handleApply(promo.code);
                            }
                          },
                          onRemoveTap: () {
                            if (promo.code == widget.selectedCode) {
                              _handleApply(null);
                            }
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "lblApplyPromocode".tr,
          style: AppThemeState().textStyleBold(
            ColorConstants.whiteColor,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.close, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Row(
      children: [
        Expanded(
          child: CommonTextFormField(
            borderRadius: 8,
            editController: codeController,
            focusNode: FocusNode(),
            labelText: 'lblEnterPromoCode'.tr,
            onChange:
                (String? value) {}, // filtering handled by controller listener
            onValidate: (String? value) {},
            suffixWidget:
                Text(
                      "lblApply".tr,
                      style: AppThemeState().textStyleRegular(
                        ColorConstants.primaryColor,
                        fontSize: 16,
                      ),
                    )
                    .onTap(() {
                      final text = codeController.text.trim();
                      if (text.isNotEmpty) {
                        _handleApply(text);
                      }
                    })
                    .paddingOnly(top: 11, right: 12),
          ),
        ),
      ],
    );
  }
}
