import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:localization_app/save.dart';
import 'package:meta/meta.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  ///First function getCachedLanguageCodeهشوف القيمه الي راجعه من الداله دي وابعتها
  ///دلوقتي ال UIبيكلم ال CUBITعن طريق ال function

  ///getSavedLanguageاو ان كان ف لغه محفوظه اصلا كنت فاتح اخر مره البرنامج عليها ف اعرضها
  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(changeLocalLanguage(local: Locale(cachedLanguageCode)));
  }

  ///هنا الداله دي هستدعيها لما اكون عاوز احفظ لغه انا اختارتها
  Future<void> changeLanguage(String languagecode) async {
    await LanguageCacheHelper().cacheLanguageCode(languagecode);
    emit(changeLocalLanguage(local: Locale(languagecode)));
  }
}
