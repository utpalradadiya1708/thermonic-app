import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/validator.dart';
import '../../theme/app_size_constants.dart';
import '../../theme/app_theme.dart';
import '../../theme/color_constants.dart';
import '../../theme/font_constants.dart';

class CommonTextFormField extends GetView {
  CommonTextFormField({
    super.key,
    required this.editController,
    required this.focusNode,
    required this.labelText,
    this.labelColor,
    this.textColor,
    required this.onChange,
    required this.onValidate,
    this.onFieldSubmitted,
    this.onFocusChange,
    this.onTap,
    this.maxLength,
    this.backgroundColor,
    this.isEnabled = true,
    this.textAlign = TextAlign.start,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIcon,
    this.contentPadding,
    this.isAlignLabelWithHint,
    this.isPassword,
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.isDecimal = false,
    this.isDenySpaces = false,
    this.isFloatingLabel = false,
    this.isAutofocus = false,
    this.labelWidget,
    this.focusColor,
    this.borderColor,
    this.isOnlyAlphabetAndNumericAllowed = false,
    this.isPostalCode = false,
    this.suffixWidget,
    this.borderRadius,
    this.onChangeDebounceDuration,
    this.onDebounceChange,
  }) {
    if (onChangeDebounceDuration != null && onDebounceChange != null) {
      debounce<String>(_debouncedText, (val) {
        onDebounceChange!(val);
      }, time: onChangeDebounceDuration!);
    }
  }

  final TextEditingController editController;
  final FocusNode focusNode;
  final int? maxLength;
  final String labelText;
  final Color? labelColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? focusColor;
  final Color? borderColor;
  final bool isEnabled;
  final TextAlign textAlign;
  final bool? isPassword;
  final TextInputType textInputType;
  final Widget? labelWidget;
  final void Function(String?) onChange;
  final String? Function(String?) onValidate;
  final void Function(String?)? onFieldSubmitted;
  final void Function(bool)? onFocusChange;
  final void Function()? onTap;
  final int maxLines;
  final int minLines;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final bool? isAlignLabelWithHint;
  final bool isDecimal;
  final bool isDenySpaces;
  final TextInputAction textInputAction;
  final bool readOnly;
  final bool isFloatingLabel;
  final bool isAutofocus;
  final bool isOnlyAlphabetAndNumericAllowed;
  final bool isPostalCode;
  final double? borderRadius;

  final Duration? onChangeDebounceDuration;
  final void Function(String)? onDebounceChange;

  final RxString _debouncedText = ''.obs;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onTap: onTap,

      enableInteractiveSelection: true,
      autofocus: isAutofocus,
      showCursor: !readOnly,
      textInputAction: textInputAction,
      controller: editController,
      focusNode: focusNode,
      enabled: isEnabled,
      readOnly: readOnly,
      textAlign: textAlign,
      obscuringCharacter: '*',
      inputFormatters: onGetInputFormatter(),
      keyboardType: textInputType,
      onChanged: (value) {
        onChange(value);
        if (onChangeDebounceDuration != null && onDebounceChange != null) {
          _debouncedText.value = value;
        }
      },
      obscureText: isPassword ?? false,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength ?? 100,
      onFieldSubmitted: onFieldSubmitted,
      cursorHeight: 15,
      autocorrect: true,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: AppSizeConstants.size_8),
        errorMaxLines: 3,
        // alignLabelWithHint: isAlignLabelWithHint ?? false,
        prefixIcon: prefixWidget,
        prefix: prefixIcon ?? const Offstage(),
        suffixIcon: suffixWidget,
        suffix: suffixIcon ?? const Offstage(),
        counterText: "",
        errorStyle: AppThemeState().textStyleRegular(ColorConstants.errorColor, fontSize: FontConstants.font_12),
        hintText: labelText,
        hintStyle: AppThemeState().textStyleRegular(labelColor ?? ColorConstants.secondaryButtonTextColor, fontSize: FontConstants.font_16),
        labelText: labelText,
        labelStyle: AppThemeState().textStyleRegular(
          labelColor ?? ColorConstants.secondaryButtonTextColor,
          fontSize: FontConstants.font_16,
        ),
        filled: true,
        alignLabelWithHint: true,
        floatingLabelBehavior: isFloatingLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
        floatingLabelStyle: AppThemeState().textStyleRegular(
          labelColor ?? ColorConstants.secondaryButtonTextColor,
          fontSize: FontConstants.font_14,
        ),
        fillColor: backgroundColor ?? ColorConstants.transparentColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(color: borderColor ?? ColorConstants.borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(color: focusColor ?? ColorConstants.borderColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(color: ColorConstants.borderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(color: ColorConstants.errorColor, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(color: ColorConstants.borderColor, width: 1),
        ),
      ),
      style: AppThemeState().textStyleRegular(textColor ?? ColorConstants.secondaryButtonTextColor, fontSize: FontConstants.font_16),
      validator: (value) => onValidate(value),
    );
  }

  List<TextInputFormatter> onGetInputFormatter() {
    List<TextInputFormatter> inputFormatter = [];

    // Common formatters for all types
    inputFormatter.addAll([
      FilteringTextInputFormatter.deny(
        RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
      ),
      InitialSpaceInputFormatter(),
    ]);

    if (textInputType == TextInputType.name) {
      inputFormatter.addAll([
        InitialZeroInputFormatter(),
        FilteringTextInputFormatter.deny(RegExp(r'[0-9]')), // ❌ disallow numbers
        // LengthLimitingTextInputFormatter(70),
      ]);
    } else if ((textInputType == TextInputType.phone || textInputType == TextInputType.number) && !isPostalCode) {
      inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')), InitialZeroInputFormatter()]);
    } else if (textInputType == TextInputType.number && isPostalCode) {
      inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp(r'^-?\d*'))]);
    } else if (textInputType == TextInputType.emailAddress) {
      inputFormatter.addAll([NoSpaceInputFormatter()]);
    } else if (textInputType == TextInputType.text && isOnlyAlphabetAndNumericAllowed) {
      inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp(r'^-?[A-Za-z0-9]*'))]);
    }

    return inputFormatter;
  }
}
