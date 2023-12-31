import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/modules/attendance/screens/attendance_screen.dart';
import 'package:riyad/modules/home/home_screen.dart';
import 'package:riyad/modules/notifications/screens/notification_screen.dart';
import 'package:riyad/modules/settings/settings_screen.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NotificationScreen(),
    AttendanceScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.selectedHomeSvg),
            icon:SvgPicture.asset(AppImages.homeSvg),
            label: 'HOME'.tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.selectedNotificationsSvg),
            icon: SvgPicture.asset(AppImages.accountSvg),
            label: 'Notifications'.tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.selectedAttendSvg),
            icon:SvgPicture.asset(AppImages.calendarSvg),
            label: 'Attendance'.tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.selectedSettingsSvg),
            icon: SvgPicture.asset(AppImages.settingsSvg),
            label: 'Settings'.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
