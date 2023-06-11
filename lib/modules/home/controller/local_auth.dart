  import 'package:local_auth/local_auth.dart';

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
            // setState(() {
            //   checkin = true;
            // });
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