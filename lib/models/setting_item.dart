import 'dart:ui';

import 'package:get/get.dart';

enum SettingSection { settingsAndPreferences, more, account }

extension SettingSectionExtension on SettingSection {
  String get trKey {
    switch (this) {
      case SettingSection.settingsAndPreferences:
        return 'lblSettingsPreferences';
      case SettingSection.more:
        return 'lblMore';
      case SettingSection.account:
        return 'lblAccount';
    }
  }

  String get tr => trKey.tr;
}

class SettingItem {
  String? title;
  SettingSection? settingSection;
  VoidCallback? onTap;
  String? image;
  Color? borderColor;
  Color? textColor;

  SettingItem({
    this.title,
    this.settingSection,
    this.onTap,
    this.borderColor,
    this.image,
    this.textColor,
  });
}
