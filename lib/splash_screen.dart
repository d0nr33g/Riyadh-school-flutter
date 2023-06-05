import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/modules/scan_auth/dailog_component.dart';
import 'package:riyad/modules/scan_auth/scan_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  goNext();
  }

  goNext() {
    Future.delayed(const Duration(seconds: 3), () {
        showLocationDialog(context);
  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SvgPicture.asset(AppImages.logoImage),
          const CircularProgressIndicator(
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
