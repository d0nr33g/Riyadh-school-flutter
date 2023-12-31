import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/attendance/bloc/attendance_bloc.dart';
import 'package:riyad/modules/attendance/bloc/bloc/daily_attend_bloc.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late AttendanceBloc attendanceBloc;
  late DailyAttendBloc dailyAttendBloc;
  @override
  void initState() {
    attendanceBloc = AttendanceBloc();
    dailyAttendBloc=DailyAttendBloc();
    attendanceBloc.add(GetWeeklyAttendance());
    dailyAttendBloc.add(GetDaylyAttendance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title:  Text(
          "Attendance".tr(),
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
          BlocBuilder<DailyAttendBloc, DailyAttendState>(
              bloc: dailyAttendBloc,
            builder: (context, state) {
              if(state is DayAttendanceLoaded){
          return Row(
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
                        Text("Days".tr(), style: AppTheme.latoTheme.displayLarge!),
                        const SizedBox(
                          height: 10,
                        ),
                         Text("per Week".tr())
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
                        state.attendDay.checkIn!=null?
                        Text( "${DateFormat('hh:mm',context.locale.toString()).format(DateTime.parse(state.attendDay.checkIn!).toLocal())}", style: AppTheme.latoTheme.displayLarge!):Text("--:--"),
                        const SizedBox(
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
                        const SizedBox(
                          height: 10,
                        ),
                        Text(state.attendDay.checkOut!.isNotEmpty?"${DateFormat('hh:mm',context.locale.toString()).format(DateTime.parse(state.attendDay.checkOut!).toLocal())}": "--:--", style: AppTheme.latoTheme.displayLarge!),
                        const SizedBox(
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
                        const SizedBox(
                          height: 10,
                        ),
                        Text(state.attendDay.workingHours!=null?"${state.attendDay.workingHours}":"--:--", style: AppTheme.latoTheme.displayLarge!),
                        const SizedBox(
                          height: 10,
                        ),
                         Text("workinghrs".tr())
                      ],
                    ),
                  ),
                ],
              );
              }else{
                return Container();
              }
    
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: BlocBuilder<AttendanceBloc, AttendanceState>(
            bloc: attendanceBloc,
            builder: (context, state) {
              if (state is AttendanceLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
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
                                          "${DateFormat('EE',context.locale.toString()).format(DateTime.parse(data.checkIn!).toLocal())}",
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
                                              "${DateFormat('hh:mm',context.locale.toString()).format(DateTime.parse(data.checkIn!).toLocal())}",
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
                                              "${DateFormat('hh:mm',context.locale.toString()).format(DateTime.parse(data.checkOut!).toLocal())}",
                                              style: AppTheme
                                                  .latoTheme.displayLarge!
                                                  .copyWith(
                                                      color: data
                                                              .isCheckedOutEarly!
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
                                      SvgPicture.asset(data.isCheckedOutEarly!
                                          ? AppImages.arrowDownSvg
                                          : AppImages.correctSvg),
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
