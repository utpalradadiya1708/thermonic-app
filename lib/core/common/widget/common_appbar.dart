import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../theme/app_size_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../../theme/font_constants.dart';
import '../constants/image_constants.dart';
import 'common_textform_field.dart';
import 'common_white_circle_with_center_icon.dart';

class CommonAppBar extends StatefulWidget {
  final String text;
  final Widget? icon; // icon shown when NOT searching
  final double? size;
  final void Function()? onTap;
  final bool isActionButtonVisible;
  final VoidCallback? onAddPressed;
  final void Function(String?)? onSearch;

  final Widget? actionWidget;
  final TextEditingController? searchController;
  final FocusNode? focusNode;

  final String searchLabelText;

  final bool showIcon;

  const CommonAppBar({
    super.key,
    required this.text,
    this.icon,
    this.showIcon = true,
    this.size,
    this.onTap,
    this.isActionButtonVisible = false,
    this.onAddPressed,
    this.searchController,
    this.focusNode,
    this.actionWidget,
    this.searchLabelText = 'lblSearchHint',
    this.onSearch,
  });

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  bool _isSearchMode = false;
  @override
  void initState() {
    super.initState();
    widget.searchController?.addListener(_onSearchTextChanged);
  }

  void _handleOutsideBackTap() {
    if (_isSearchMode) {
      setState(() {
        _isSearchMode = false;
        widget.searchController?.clear();
      });
      widget.onSearch?.call('');
    } else {
      if (widget.onTap != null) {
        widget.onTap!();
      } else {
        Get.back();
      }
    }
  }

  void _handlePrefixBackTap() {
    setState(() {
      _isSearchMode = false;
      widget.searchController?.clear();
    });
    widget.onSearch?.call('');
  }

  void _handleSuffixBackTap() {
    setState(() {
      widget.searchController?.clear();
    });
    widget.onSearch?.call('');
  }

  void _enterSearchMode() {
    setState(() {
      _isSearchMode = true;
    });
  }

  void _onSearchTextChanged() {
    setState(() {
      // This rebuilds the widget so suffix icon updates based on text presence
    });
  }

  @override
  void dispose() {
    widget.searchController?.removeListener(_onSearchTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showIcon && !_isSearchMode) ...[
          CommonWhiteCircleWithCenterIcon(
            onTap: _handleOutsideBackTap,
            child: SvgPicture.asset(
              color:  ColorConstants.whiteColor,
              ImageConstants.icBackArrow,
              matchTextDirection: true,
            ),
          ),
          20.hBox,
        ],
        Expanded(
          child: _isSearchMode
              ? CommonTextFormField(
                  labelText: widget.searchLabelText.tr,
                  editController: widget.searchController!,
                  focusNode: widget.focusNode!,
                  // contentPadding: EdgeInsets.zero,
                  prefixWidget: GestureDetector(
                    onTap: _handlePrefixBackTap,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        ImageConstants.icBackArrow,
                        matchTextDirection: true,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  suffixWidget: widget.searchController!.text.isNotEmpty
                      ? GestureDetector(
                          onTap: _handleSuffixBackTap,
                          child: Transform.rotate(
                            angle: math.pi / 4,
                            child: Icon(
                              Icons.add,
                              color: ColorConstants.whiteColor,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  onChange: widget.onSearch ?? (value) {},
                  // onChange: (value) {},
                  onValidate: (value) {
                    return null;
                  },
                  isAutofocus: true,
                )
              : Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.text,
                        style: AppThemeState().textStyleRegular(
                          ColorConstants.blackColor,
                          fontSize: FontConstants.font_20,
                        ),
                      ),
                    ),
                    if (widget.icon != null)
                      GestureDetector(
                        onTap: _enterSearchMode,
                        child: widget.icon!,
                      ),
                  ],
                ),
        ),
        ?(widget.isActionButtonVisible)
            ? widget.actionWidget
            : SizedBox.shrink(),
      ],
    ).marginOnly(
      top: MediaQuery.of(context).viewPadding.top,
      bottom: widget.size ?? AppSizeConstants.size_20,
    );
  }
}
