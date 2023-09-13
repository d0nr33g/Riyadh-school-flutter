import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/attendance/bloc/bloc/daily_attend_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riyad/modules/home/components/checkIn_component.dart';
import 'package:riyad/modules/home/components/checkOut_component.dart';
import 'package:riyad/modules/home/components/clock_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notifications/screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DailyAttendBloc dailyAttendBloc;
  late StreamSubscription<Position> positionStream;
  double lat=0.0;
  double lang=0.0;
  String? userName;
  String? userId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startListening();
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
    print("dataUpdated");
  }


  void startListening() {
    // Check if location services are enabled
    Geolocator.isLocationServiceEnabled().then((serviceEnabled) {
      if (!serviceEnabled) {
        // Location services are not enabled, handle it accordingly
        return;
      }

      // Check for location permission
      Geolocator.checkPermission().then((permission) {
        if (permission == LocationPermission.denied) {
          Geolocator.requestPermission().then((newPermission) {
            if (newPermission == LocationPermission.denied) {
              // Permission is denied, handle it accordingly
              return;
            }

            // Start listening to location updates
            startListeningUpdates();
          });
        } else {
          // Start listening to location updates
          startListeningUpdates();
        }
      });
    });
  }

  void startListeningUpdates() {
    positionStream = Geolocator.getPositionStream(
    ).listen((Position position) {
      // Handle the updated position
      setState(() {
        lang= position.longitude;
        lat= position.latitude;
      });
      double latitude = position.latitude;
      double longitude = position.longitude;
      print('Latitude: $latitude, Longitude: $longitude');
    });
  }

  void stopListening() {
    if (positionStream != null) {
      positionStream.cancel(); // Cancel the location updates stream
    }
  }

@override
  void dispose() {
  stopListening();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
                    "${userName}",
                    style: AppTheme.latoTheme.displayMedium,
                  ),
                 Text("UserName".tr()),
              ],
            ),
            ClockComponent(),
            BlocBuilder<DailyAttendBloc, DailyAttendState>(
              bloc: dailyAttendBloc,
              builder: (context, state) {
                if (state is DayAttendanceLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryColor),
                  );
                } else if (state is DayAttendanceLoaded) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // isCheckIn==false?
                          state.attendDay.lastStatus == "CHECK_IN"
                              ? CheckOutComponent(dailyAttendBloc)
                              : CheckInComponent(dailyAttendBloc),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // isCheckIn == false
                              //     ?
                              Stack(
                                children: [
                                  SvgPicture.asset(
                                      AppImages.notificationCircleSvg),
                                  Positioned(
                                      bottom: 20,
                                      right:N.notificationLength>9? MediaQuery.sizeOf(context).width/22:MediaQuery.sizeOf(context).width/16,
                                      child: Center(
                                        child: Text(
                                          "${N.notificationLength}",
                                          style: AppTheme.latoTheme.displayMedium!
                                              .copyWith(
                                                  color: AppColors.whiteColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                              )
                              // : Container(
                              //     width: MediaQuery.of(context).size.width / 5,
                              //   ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 10,
                          ),
                       //   Text("Location : $lat:$lang"),
                       Text("Inside Riyahd Schools")
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
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
                                 Text("Checkin".tr())
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
                                state.attendDay.checkOut!.isNotEmpty
                                    ? Text(
                                        "${DateFormat('hh:mm').format(DateTime.parse(state.attendDay.checkOut!).toLocal())}",
                                        style: AppTheme.latoTheme.displayLarge!)
                                    : Text("--:--"),
                                SizedBox(
                                  height: 10,
                                ),
                                 Text("Checkout".tr())
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
                                Text(
                                    state.attendDay.workingHours != null
                                        ? "${state.attendDay.workingHours}"
                                        : "--:--",
                                    style: AppTheme.latoTheme.displayLarge!),
                                SizedBox(
                                  height: 10,
                                ),
                                 Text("workinghrs".tr())
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
