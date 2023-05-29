import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
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

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('hh:mm a \n EEEE, MMM d').format(now);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(),
            const Text("8686484864468"),
            const Text("Id-Number"),
            Text(
              formattedDate,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
            ),
            InkWell(
                onTap: () {
                  fetchBiometricData();
                },
                child: SvgPicture.asset(AppImages.getReadySvg))
          ],
        ),
      ),
    );
  }
}
