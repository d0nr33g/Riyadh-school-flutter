import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/scan_auth/screens/scan_auth.dart';
import 'package:riyad/modules/settings/about_us.dart';
import 'package:riyad/modules/settings/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String userId="";
  String userName="";
  getUserId()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
      userId= preferences.getString("userId")!;
      userName = preferences.getString("userName")!;
    });
  }
  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
     preferences.setBool("notFirstTime",true);
         Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ScanAuth()),
          (route) => false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title:  Text(
          "Settings".tr(),
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
                  Text("$userName",
                      style: AppTheme.latoTheme.displayMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("UserName".tr()),
                ],
              ),
              ListTile(
                onTap: () {
                  showLanguageDialog(context);
                },
                title: Text("language".tr(),
                    style: AppTheme.latoTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                leading: SvgPicture.asset(AppImages.translateSvg),
              ),
              ListTile(
                onTap: () {},
                title: Text("CONTACTUS".tr(),
                    style: AppTheme.latoTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                leading: SvgPicture.asset(AppImages.callSvg),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AboutUS()));
                },
                title: Text("ABOUTUS".tr(),
                    style: AppTheme.latoTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500)),
                leading: SvgPicture.asset(AppImages.infoSvg),
              ),
              ListTile(
                onTap: () {
                logOut();
                },
                title: Text("LOGOUT".tr(),
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
