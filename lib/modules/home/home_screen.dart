import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/attendance/bloc/bloc/daily_attend_bloc.dart';
import 'package:riyad/modules/home/bloc/clock_cubit.dart';
import 'package:riyad/modules/home/components/checkIn_component.dart';
import 'package:riyad/modules/home/components/checkOut_component.dart';
import 'package:riyad/modules/home/components/clock_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool checkin = false;
  bool checkout = false;
  bool getReady = false;
  late DailyAttendBloc dailyAttendBloc;
  // String checkinTime ="00:00";
  // DateTime? checkOutTime;
  String? userName;
  String? userId;
  Future<void> fetchBiometricData(DateTime state) async {
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
            setState(() {
              if (checkin == false) {
                checkin = true;
              } else if (checkout == false) {
                checkout = true;
                checkin = false;
              }
            });
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
  void initState() {
    // TODO: implement initState
    super.initState();
    dailyAttendBloc = DailyAttendBloc();
    dailyAttendBloc.add(GetDaylyAttendance());
    getUsetData();
  }

  getUsetData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      userName = pref.getString("userName");
      userId = pref.getString("userId");
    });
  }

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('EEEE, MMM d').format(now);
    // String formattedTime = DateFormat('hh:mm a').format(now);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"),
                ),
                SizedBox(
                  height: 10,
                ),
                if (userId != null)
                  Text(
                    "${userId}",
                    style: AppTheme.latoTheme.displayMedium,
                  ),
                const Text("ID Number"),
              ],
            ),
            ClockComponent(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                checkin==false?
                CheckInComponent(dailyAttendBloc):
                CheckOutComponent(dailyAttendBloc),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    checkin == false
                        ? Stack(
                            children: [
                              SvgPicture.asset(AppImages.notificationCircleSvg),
                              Positioned(
                                  bottom: 20,
                                  right: 18,
                                  child: Text(
                                    "27",
                                    style: AppTheme.latoTheme.displayMedium!
                                        .copyWith(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 10,
                ),
                Text("Location : You Are Not In Office Reach"),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<DailyAttendBloc, DailyAttendState>(
              bloc: dailyAttendBloc,
              builder: (context, state) {
                if (state is DayAttendanceLoaded) {
                  return Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SvgPicture.asset(AppImages.timeInSvg),
                            SizedBox(
                              height: 10,
                            ),
                            state.attendDay.checkIn != null
                                ? Text(
                                    "${DateFormat('hh:mm').format(DateTime.parse(state.attendDay.checkIn!).toLocal())}",
                                    style: AppTheme.latoTheme.displayLarge!)
                                : Text("--:--"),
                            SizedBox(
                              height: 10,
                            ),
                            const Text("Checkin")
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SvgPicture.asset(AppImages.timeOutSvg),
                            SizedBox(
                              height: 10,
                            ),
                            Text("00:00",
                                style: AppTheme.latoTheme.displayLarge!),
                            SizedBox(
                              height: 10,
                            ),
                            const Text("Checkout")
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SvgPicture.asset(AppImages.timertSvg),
                            SizedBox(
                              height: 10,
                            ),
                            Text("${state.attendDay.workingHours}",
                                style: AppTheme.latoTheme.displayLarge!),
                            SizedBox(
                              height: 10,
                            ),
                            const Text("working hr's")
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
