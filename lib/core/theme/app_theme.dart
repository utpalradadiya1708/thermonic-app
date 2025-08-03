import 'package:flutter/material.dart';
import 'package:thermonic/core/theme/color_constants.dart';

import 'font_type.dart';

///
/// This class contains all UI related styles
///
class AppTheme extends StatefulWidget {
  final Widget? child;

  const AppTheme({super.key, @required this.child});

  @override
  State<StatefulWidget> createState() {
    return AppThemeState();
  }

  static AppThemeState of(BuildContext context) {
    final _InheritedStateContainer? inheritedStateContainer = context
        .dependOnInheritedWidgetOfExactType();
    if (inheritedStateContainer == null) {
      return AppThemeState();
    } else {
      return inheritedStateContainer.data!;
    }
  }
}

class AppThemeState extends State<AppTheme> {
  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(data: this, child: widget.child);
  }

  InputDecoration chatInputDecoration(Color fillColor) => InputDecoration(
    filled: false,
    fillColor: fillColor,
    counter: null,
    contentPadding: EdgeInsets.zero,
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    // focusedBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
  );

  BoxShadow commonBoxShadow() {
    return const BoxShadow(
      color: Color(0x0c000000),
      blurRadius: 20,
      offset: Offset(0, 0),
    );
  }

  TextStyle customTextStyle({
    double fontSize = 12,
    Color? color,
    FWT? fontWeightType,
    FFT? fontFamilyType,
    double? height,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(fontWeightType),
      fontFamily: FontType.getFontFamilyType(fontFamilyType),
      fontSize: fontSize,
      fontStyle: fontStyle,
      height: 1.5,
      color: color,
    );
  }

  TextStyle myTextStyle({
    double fontSize = 12,
    Color? color,
    FWT? fontWeightType,
    FFT? fontFamilyType,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(fontWeightType),
      fontFamily: FontType.getFontFamilyType(fontFamilyType),
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
    );
  }

  TextStyle textStyleMedium(
    Color color, {
    double fontSize = 12,
    TextDecoration? decoration,
    FFT fontFamily = FFT.gilroy,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(FWT.medium),
      fontFamily: FontType.getFontFamilyType(fontFamily),
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle textStyleSemiBold(
    Color color, {
    double fontSize = 12,
    TextDecoration? decoration,
    FFT fontFamily = FFT.gilroy,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(FWT.semiBold),
      fontFamily: FontType.getFontFamilyType(fontFamily),
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle textStyleBold(
    Color color, {
    double fontSize = 12,
    TextDecoration? decoration,
    FFT fontFamily = FFT.gilroy,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(FWT.bold),
      fontFamily: FontType.getFontFamilyType(fontFamily),
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle textStyleLight(
    Color color, {
    double fontSize = 12,
    TextDecoration? decoration,
    FFT fontFamily = FFT.gilroy,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(FWT.light),
      fontFamily: FontType.getFontFamilyType(fontFamily),
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle textStyleRegular(
    Color color, {
    double fontSize = 12,
    TextDecoration? decoration,
    FFT fontFamily = FFT.gilroy,
    Color? decorationColor,
  }) {
    return TextStyle(
      decoration: decoration,
      decorationColor: decorationColor ?? ColorConstants.greyColor,
      fontWeight: FontType.getFontWeightType(FWT.regular),
      fontFamily: FontType.getFontFamilyType(fontFamily),
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle textStyleExtraBold(
    Color color, {
    double fontSize = 12,
    TextDecoration? decoration,
    FFT fontFamily = FFT.gilroy,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(FWT.extraBold),
      fontFamily: FontType.getFontFamilyType(fontFamily),
      fontSize: fontSize,
      color: color,
    );
  }

  TextStyle underLinetextStyleExtraBold(
    Color color, {
    double fontSize = 12,
    TextDecoration? decoration,
    FFT fontFamily = FFT.gilroy,
  }) {
    return TextStyle(
      decoration: decoration,
      fontWeight: FontType.getFontWeightType(FWT.extraBold),
      fontFamily: FontType.getFontFamilyType(fontFamily),
      fontSize: fontSize,
      color: color,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final AppThemeState? data;

  _InheritedStateContainer({@required this.data, @required Widget? child})
    : assert(child != null),
      super(child: child!);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
