import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            const CircleAvatar(),
            const Text("8686484864468"),
            const Text("Id-Number"),
            Text(
              formattedTime,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            Text(
              formattedDate,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: AppColors.textColor),
            ),
            InkWell(
                onTap: () {
                  fetchBiometricData();
                },
                child: SvgPicture.asset(AppImages.getReadySvg)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 10,
                ),
                Text("location: you are not in office reach"),
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
                      const Text("09:10"),
                      const Text("Checkin")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SvgPicture.asset(AppImages.timeOutSvg),
                      const Text("--:--"),
                      const Text("Checkout")
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SvgPicture.asset(AppImages.timertSvg),
                      const Text("--:--"),
                      const Text("working hr's")
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 37,
            ),
          ],
        ),
      ),
    );
  }
}
