import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:riyad/app.dart';
import 'package:riyad/app_observer.dart';
import 'package:riyad/localization/translate_preferences.dart';
import 'package:riyad/splash_screen.dart';
Future<void> main() async {
  debugPrint("############ welcome in dev ############");
  WidgetsFlutterBinding.ensureInitialized();
  
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  LocalizationDelegate.create(
          preferences: TranslatePreferences(),
          fallbackLocale: 'en',
          supportedLocales: <String>['en', 'ar'])
      .then((LocalizationDelegate delegate) {
    BlocOverrides.runZoned(
      () => runApp(LocalizedApp(delegate, App())),
      blocObserver: AppBlocObserver(),
    );
  });
}