import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_app/app_localization.dart';
import 'package:localization_app/cubit/cubit/local_cubit.dart';
import 'package:localization_app/presentations/screens/homeScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalCubit()..getSavedLanguage(),
        ),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        builder: (context, state) {
          if (state is changeLocalLanguage) {
            return MaterialApp(
              locale: state.local,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.blue[800],
                ),
              ),
              debugShowCheckedModeBanner: false,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }

                return supportedLocales.first;
              },
              home: const HomePage(),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
