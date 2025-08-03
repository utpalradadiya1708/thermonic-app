import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:thermonic/localization/st_arabic.dart';
import 'package:thermonic/localization/st_english.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': stEnglish,
    'ar': stArabic,
    // 'ur': stUrdu,
    // 'hi':stHindi,
    // 'ta':stTamil,
    // 'bn':stBangla
  };
}
