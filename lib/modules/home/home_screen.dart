import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool checkin = false;
  bool checkout = false;
  bool getReady = false;
  Future<void> fetchBiometricData() async {
    final localAuth = LocalAuthentication();

    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      if (canCheckBiometrics) {
        bool isFingerprintAvailable = await localAuth.canCheckBiometrics;

        if (isFingerprintAvailable) {
          bool didAuthenticate = await localAuth.authenticate(
            localizedReason: 'Scan your fingerprint to authenticate',
          );
          if (didAuthenticate) {
            setState(() {
              checkin = true;
            });
            print('Fingerprint authentication succeeded');
          } else {
            print('Fingerprint authentication failed');
          }
        } else {
          print('Fingerprint authentication is not available');
        }
      } else {
        print('Biometric authentication is not available');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  late Position _currentPosition;
  Future<void> _getCurrentPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMM d').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "4545454",
                  style: AppTheme.latoTheme.displayMedium,
                ),
                const Text("ID Number"),
              ],
            ),
            Text(formattedTime,
                textAlign: TextAlign.center,
                style: AppTheme.latoTheme.displayLarge!.copyWith(fontSize: 51)),
            Text(
              formattedDate,
              textAlign: TextAlign.center,
              style: AppTheme.latoTheme.displayLarge!
                  .copyWith(fontSize: 25, color: AppColors.textColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  children: [
                    InkWell(
                        onTap: () {
                          fetchBiometricData();
                        },
                        child: checkin
                            ? SvgPicture.asset(AppImages.checkoutSvg)
                            : SvgPicture.asset(AppImages.checkineSvg)),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    checkin == false
                        ? Stack(
                            children: [
                              SvgPicture.asset(AppImages.notificationCircleSvg),
                              Positioned(
                                  bottom: 20,
                                  right: 18,
                                  child: Text(
                                    "27",
                                    style: AppTheme.latoTheme.displayMedium!
                                        .copyWith(
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.bold),
                                  )),
                            ],
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 10,
                ),
                Text("Location : You Are Not In Office Reach"),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SvgPicture.asset(AppImages.timeInSvg),
                      SizedBox(
                        height: 10,
                      ),
                      Text("09:10", style: AppTheme.latoTheme.displayLarge!),
                      SizedBox(
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
                      SizedBox(
                        height: 10,
                      ),
                      Text("--:--", style: AppTheme.latoTheme.displayLarge!),
                      SizedBox(
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
                      SizedBox(
                        height: 10,
                      ),
                      Text("--:--", style: AppTheme.latoTheme.displayLarge!),
                      SizedBox(
                        height: 10,
                      ),
                      const Text("working hr's")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
