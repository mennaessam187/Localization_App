import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  ///code for save this language in "LOCALE" variable
  ///يعني لم استدعيها فانا بقوله احفظ اللغه الي هديهالك ف القيمه دي
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
  }

  ///to get the saved language the latest language the app open it
  ///يعني لما استدعيها البرنامج يعرض اللعه الي حفظتها دي
  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}
