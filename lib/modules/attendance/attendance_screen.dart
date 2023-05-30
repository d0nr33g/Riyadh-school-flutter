import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
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
          const SizedBox(height: 30,),
          Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
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
                                    Text("03:00",
                                        style: AppTheme.latoTheme.displayLarge!
                                            .copyWith(
                                                color: AppColors.primaryColor)),
                                                   const SizedBox(width: 5,),
                                    SvgPicture.asset(AppImages.correctSvg),
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
                                    Text("03:00",
                                        style: AppTheme.latoTheme.displayLarge!
                                            .copyWith(
                                                color: AppColors.primaryColor)),
                                                const SizedBox(width: 5,),
                                    SvgPicture.asset(AppImages.correctSvg),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text("08:00",
                                    style: AppTheme.latoTheme.displayLarge!),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
