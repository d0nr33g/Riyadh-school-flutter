import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/attendance/bloc/attendance_bloc.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late AttendanceBloc attendanceBloc;
  @override
  void initState() {
    attendanceBloc = AttendanceBloc();
    attendanceBloc.add(GetWeeklyAttendance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          "Attendance",
          style: TextStyle(color: AppColors.blackColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text("Working Hours Are From 7 Am To 3 Pm"),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 40,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Days", style: AppTheme.latoTheme.displayLarge!),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("per Week")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SvgPicture.asset(AppImages.timeInSvg),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("09:10", style: AppTheme.latoTheme.displayLarge!),
                    const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text("--:--", style: AppTheme.latoTheme.displayLarge!),
                    const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text("--:--", style: AppTheme.latoTheme.displayLarge!),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("working hr's")
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: BlocBuilder<AttendanceBloc, AttendanceState>(
            bloc: attendanceBloc,
            builder: (context, state) {
              print("kokoko ${state}");
              if (state is AttendanceLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.primaryColor,),
                );
              }
              if (state is AttendanceLoaded) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.attendWeekList.length,
                    itemBuilder: (context, index) {
                      var data = state.attendWeekList[index];
                      return Container(
                        height: 80,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${DateFormat('EE').format(DateTime.parse(data.checkIn!).toLocal())}",
                                          style: AppTheme
                                              .latoTheme.displayLarge!
                                              .copyWith(
                                                  color:
                                                      AppColors.primaryColor)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      data.checkOut != null
                                          ? Text(
                                              "${DateFormat('hh:mm').format(DateTime.parse(data.checkIn!).toLocal())}",
                                              style: AppTheme
                                                  .latoTheme.displayLarge!
                                                  .copyWith(
                                                      color: data
                                                              .isCheckedInLate!
                                                          ? AppColors.redColor
                                                          : AppColors
                                                              .primaryColor))
                                          : Text("00:00",
                                              style: AppTheme
                                                  .latoTheme.displayLarge!
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryColor)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(data.isCheckedInLate!
                                          ? AppImages.arrowDownSvg
                                          : AppImages.correctSvg),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      data.checkOut != null
                                          ? Text(
                                              "${DateFormat('hh:mm').format(DateTime.parse(data.checkOut!).toLocal())}",
                                              style: AppTheme
                                                  .latoTheme.displayLarge!
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryColor))
                                          : Text("00:00",
                                              style: AppTheme
                                                  .latoTheme.displayLarge!
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryColor)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SvgPicture.asset(AppImages.correctSvg),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("${data.workingHours}",
                                      style: AppTheme.latoTheme.displayLarge!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Container();
              }
            },
          )),
        ],
      ),
    );
  }
}
