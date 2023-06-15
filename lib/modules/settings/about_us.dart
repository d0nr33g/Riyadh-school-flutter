import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.logoImage,
                height: 350,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                 "aboutUS",
                  style: AppTheme.latoTheme.bodyMedium!
                      .copyWith(color: AppColors.whiteColor, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
