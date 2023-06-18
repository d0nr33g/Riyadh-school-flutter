import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/modules/attendance/bloc/bloc/daily_attend_bloc.dart';
import 'package:riyad/modules/home/bloc/home_bloc/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckInComponent extends StatefulWidget {
  DailyAttendBloc dailyAttendBloc;
  CheckInComponent(this.dailyAttendBloc, {super.key});

  @override
  State<CheckInComponent> createState() => _CheckInComponentState();
}

class _CheckInComponentState extends State<CheckInComponent> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = HomeBloc();
    super.initState();
  }
 Future<void> fetchBiometricData() async {
    final localAuth = LocalAuthentication();

    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      if (canCheckBiometrics) {
        bool isFingerprintAvailable = await localAuth.canCheckBiometrics;

        if (isFingerprintAvailable) {
          bool didAuthenticate = await localAuth.authenticate(
            localizedReason: 'Scan your fingerprint to authenticate',
          );
          if (didAuthenticate) {
           homeBloc.add(CkeckInEvent());
            print('Fingerprint authentication succeeded');
          } else {
            print('Fingerprint authentication failed');
          }
        } else {
          print('Fingerprint authentication is not available');
        }
      } else {
        print('Biometric authentication is not available');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        if (state is CheckInfailed) {
          var snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is CheckInLoaded) {
          widget.dailyAttendBloc.add(GetDaylyAttendance());
        }
        return Column(
          children: [
            InkWell(
                onTap: () {
                 fetchBiometricData();
                },
                child: SvgPicture.asset(AppImages.checkineSvg)),
          ],
        );
      },
    );
  }
}
