import 'package:flutter/material.dart';

extension ContextUtil on BuildContext {
  /// hide keyboard
  void hideKeyboard() {
    if (mounted) {
      FocusScope.of(this).requestFocus(FocusNode());
    }
  }
}

extension StringUtils on String? {
  bool isNotNullEmpty() {
    String? value = this;
    if (value != null && value.isNotEmpty) {
      return true;
    }
    return false;
  }
}

extension IsShow on Widget {
  Widget isVisible(bool visible) {
    return Visibility(visible: visible, child: this);
  }
}

extension Clickable on Widget {
  Widget onTap(VoidCallback? onTap) {
    return InkWell(onTap: onTap, child: this);
  }
}

extension StringExtensions on String? {
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  String get capitalizeFirstLetter {
    if (this == null || this!.isEmpty) return '';
    return this![0].toUpperCase() + this!.substring(1);
  }
}

extension HBox on num {
  Widget get hBox => SizedBox(width: toDouble());
}

extension VBox on num {
  Widget get vBox => SizedBox(height: toDouble());
}
