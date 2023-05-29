import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_images.dart';

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
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("6546454545454545"),
              const Text("NumberID"),
              ListTile(
                onTap: () {},
                title: const Text("Languages"),
                leading: SvgPicture.asset(AppImages.translateSvg),
              ),
              ListTile(
                onTap: () {},
                title: const Text("Contact us"),
                leading: SvgPicture.asset(AppImages.callSvg),
              ),
              ListTile(
                onTap: () {},
                title: const Text("About us"),
                leading: SvgPicture.asset(AppImages.infoSvg),
              ),
              ListTile(
                onTap: () {},
                title: const Text("Logout"),
                leading: SvgPicture.asset(AppImages.logoutSvg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
