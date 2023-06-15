import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/scan_auth/screens/scan_auth.dart';
import 'package:riyad/modules/settings/about_us.dart';
import 'package:riyad/modules/settings/language.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          "Settings",
          style: TextStyle(color: AppColors.blackColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"),
                    radius: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("6546445",
                      style: AppTheme.latoTheme.displayMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("ID Number"),
                ],
              ),
              ListTile(
                onTap: () {showLanguageDialog(context);},
                title: Text(translate("language"),
                    style: AppTheme.latoTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                leading: SvgPicture.asset(AppImages.translateSvg),
              ),
              ListTile(
                onTap: () {},
                title: Text("CONTACT US",
                    style: AppTheme.latoTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                leading: SvgPicture.asset(AppImages.callSvg),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>AboutUS()));
                },
                title: Text("ABOUT US",
                    style: AppTheme.latoTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                leading: SvgPicture.asset(AppImages.infoSvg),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const ScanAuth()),
                      (route) => false);
                },
                title: Text("LOGOUT",
                    style: AppTheme.latoTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                leading: SvgPicture.asset(AppImages.logoutSvg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
