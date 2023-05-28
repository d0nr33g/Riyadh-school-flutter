
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_translate/flutter_translate.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/splash_screen.dart';
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalizationDelegate localizationDelegate =
        LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (BuildContext context, Widget? widget) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              localizationDelegate
            ],
            supportedLocales: localizationDelegate.supportedLocales,
            locale: localizationDelegate.currentLocale,
            debugShowCheckedModeBanner: false,
            title: "School",
            theme: AppTheme.light(),
            home: SplashScreen(),
          );
        },
      ),
    );
  }

}
