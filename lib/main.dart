import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:riyad/app_observer.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/localization/translate_preferences.dart';
import 'package:riyad/modules/attendance/bloc/attendance_bloc.dart';
import 'package:riyad/modules/home/bloc/clock_cubit.dart';
import 'package:riyad/modules/scan_auth/bloc/auth_bloc.dart';
import 'package:riyad/splash_screen.dart';

 main() async {
  debugPrint("############ welcome in dev ############");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  var delegate = await LocalizationDelegate.create(
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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: ScreenUtilInit(
          designSize: const Size(430, 32),
          builder: (BuildContext context, Widget? widget) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => ClockCubit(),
                ),
                  BlocProvider(
                  create: (_) => AuthBloc(),
                ),
                   BlocProvider(
                  create: (_) => AttendanceBloc(),
                ),
              ],
              child: MaterialApp(
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  localizationDelegate
                ],
                supportedLocales: localizationDelegate.supportedLocales,
                locale: localizationDelegate.currentLocale,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light(),
                home: const SplashScreen(),
              ),
            );
          }),
    );
  }
}
