import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: const Text("Notifications",style: TextStyle(color: AppColors.blackColor),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child:  ListTile(
                  title: Text(
                      "Library that allows you to display progres",style: AppTheme.latoTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500
                      ),),
                  subtitle: Row(
                    children: [SvgPicture.asset(AppImages.clockActiveSvg), SizedBox(width: 10,),Text("NOW")],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
