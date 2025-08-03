import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/core/common/constants/app_constants.dart';
import 'package:thermonic/utils/logger_util.dart';

import '../core/common/repository/local_data/local_data_source.dart';
import '../core/di/injector_container.dart';

class LocaleController extends GetxController {
  var currentLocale = 'en'.obs;
  var selectedLanguage = 'English'.obs;
  LocalDataSource localDataSource = getIt<LocalDataSource>();

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  /// Load the saved language from SharedPreferences
  void loadSavedLanguage() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? savedLang = prefs.getString('selectedLanguage');
    String? savedLang = await localDataSource.getData('selectedLanguage');
    MyLogger.log('print this value $savedLang');
    if (savedLang != null) {
      currentLocale.value = savedLang;
      selectedLanguage.value = languages.keys.firstWhere(
        (key) => languages[key]!.languageCode == savedLang,
        orElse: () => "English",
      );
      AppConstants.selectedLanguage == selectedLanguage.value;
      Get.updateLocale(Locale(savedLang));
    }
  }

  /// Change language and store it in SharedPreferences
  void changeLanguage(String languageName) async {
    if (languages.containsKey(languageName)) {
      selectedLanguage.value = languageName;
      currentLocale.value = languages[languageName]!.languageCode;
      AppConstants.selectedLanguage = languages[languageName]!.languageCode;
      Get.updateLocale(languages[languageName]!);
      //
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('selectedLanguage', currentLocale.value);
      await localDataSource.setData('selectedLanguage', currentLocale.value);
    }
  }

  final Map<String, Locale> languages = {
    "English": const Locale('en'),
    "Arabic": const Locale('ar'),
  };
}
