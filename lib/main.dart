import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riyad/app_observer.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/localization/translate_preferences.dart';
import 'package:riyad/modules/attendance/bloc/attendance_bloc.dart';
import 'package:riyad/modules/attendance/bloc/bloc/daily_attend_bloc.dart';
import 'package:riyad/modules/home/bloc/bloc/checkout_bloc.dart';
import 'package:riyad/modules/home/bloc/clock_cubit.dart';
import 'package:riyad/modules/home/bloc/home_bloc/home_bloc.dart';
import 'package:riyad/modules/notifications/bloc/notification_bloc.dart';
import 'package:riyad/modules/scan_auth/bloc/auth_bloc.dart';
import 'package:riyad/splash_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

 main() async {
  debugPrint("############ welcome in dev ############");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
   tz.initializeTimeZones();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
 BlocOverrides.runZoned(
      () => runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      child: App()
    ),
  ),
      blocObserver: AppBlocObserver(),
    );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
 

    return  ScreenUtilInit(
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
                   BlocProvider(
                  create: (_) => DailyAttendBloc(),
                ),
                    BlocProvider(
                  create: (_) => HomeBloc(),
                ),
                     BlocProvider(
                  create: (_) => CheckoutBloc(),
                ),
                BlocProvider(
                  create: (_) => NotificationBloc(),
                ),
              ],
              child: MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light(),
                home: const SplashScreen(),
                 navigatorObservers: [ChuckerFlutter.navigatorObserver],
              ),
            );
          }
    );
  }
}
