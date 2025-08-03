enum AppLanguage { english, arabic }

extension AppLanguageExtension on AppLanguage {
  String get key {
    switch (this) {
      case AppLanguage.english:
        return 'English';
      case AppLanguage.arabic:
        return 'Arabic';
    }
  }
}
