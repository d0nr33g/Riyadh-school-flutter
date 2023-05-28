import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';

Future<void> showLocationDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          width: 317.0, // Custom width
          height: 405.0, // Custom height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your Location",
                style: AppTheme.latoTheme.displaySmall!.copyWith(
                    color: AppColors.blackColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(AppImages.locationSvg),
              const SizedBox(
                height: 20,
              ),
              Text(
                "access location",
                style: AppTheme.latoTheme.labelLarge!.copyWith(
                    color: AppColors.blackColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "We need access to your",
                style: AppTheme.latoTheme.bodyLarge!.copyWith(
                    color: AppColors.textColor, fontWeight: FontWeight.w500),
              ),
              Text(
                "site to be able to check in",
                style: AppTheme.latoTheme.bodyLarge!.copyWith(
                    color: AppColors.textColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SizedBox(
                        height: 46,
                        width: 89,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.blackColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Back"))),
                    const Spacer(),
                    SizedBox(
                        height: 46,
                        width: 180,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              getLocationpermission(context);
                            },
                            child: const Text("Access"))),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showCameraDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          width: 317.0, // Custom width
          height: 405.0, // Custom height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your Camera",
                style: AppTheme.latoTheme.displaySmall!.copyWith(
                    color: AppColors.blackColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(AppImages.cameraSvg),
              const SizedBox(
                height: 20,
              ),
              Text(
                "access camera",
                style: AppTheme.latoTheme.labelLarge!.copyWith(
                    color: AppColors.blackColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "We need access to your",
                style: AppTheme.latoTheme.bodyLarge!.copyWith(
                    color: AppColors.textColor, fontWeight: FontWeight.w500),
              ),
              Text(
                "camera to be able to check in",
                style: AppTheme.latoTheme.bodyLarge!.copyWith(
                    color: AppColors.textColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SizedBox(
                        height: 46,
                        width: 89,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.blackColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Back"))),
                    const Spacer(),
                    SizedBox(
                        height: 46,
                        width: 180,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              getCameraPermission(context);
                            },
                            child: const Text("Access"))),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showFingerprintDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: SizedBox(
          width: 317.0, // Custom width
          height: 405.0, // Custom height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Your Fingerprint",
                style: AppTheme.latoTheme.displaySmall!.copyWith(
                    color: AppColors.blackColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(AppImages.fingerPrintSvg),
              const SizedBox(
                height: 20,
              ),
              Text(
                "access fingerprint",
                style: AppTheme.latoTheme.labelLarge!.copyWith(
                    color: AppColors.blackColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "We need access to your",
                style: AppTheme.latoTheme.bodyLarge!.copyWith(
                    color: AppColors.textColor, fontWeight: FontWeight.w500),
              ),
              Text(
                "fingerprint to be able to check in",
                style: AppTheme.latoTheme.bodyLarge!.copyWith(
                    color: AppColors.textColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    SizedBox(
                        height: 46,
                        width: 89,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.blackColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Back"))),
                    const Spacer(),
                    SizedBox(
                        height: 46,
                        width: 180,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.primaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              getFingerprintPermission(context);
                            },
                            child: const Text("Access"))),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

getLocationpermission(context) async {
  PermissionStatus status = await Permission.location.request();
  if (status.isGranted) {
    // Location permission granted
    print("mohamed");
    Navigator.pop(context);
    showCameraDialog(context);
  } else if (status.isDenied) {
    // Location permission denied
  } else if (status.isPermanentlyDenied) {
    // Location permission permanently denied, navigate user to app settings
  } else if (status.isRestricted) {
    // Location permission restricted, usually due to parental controls
  }
}

getCameraPermission(context) async {
  PermissionStatus status = await Permission.camera.request();
  if (status.isGranted) {
    // Location permission granted
    print("mohamed");
    Navigator.pop(context);
    showFingerprintDialog(context);
  } else if (status.isDenied) {
    // Location permission denied
  } else if (status.isPermanentlyDenied) {
    // Location permission permanently denied, navigate user to app settings
  } else if (status.isRestricted) {
    // Location permission restricted, usually due to parental controls
  }
}

getFingerprintPermission(context) async {
  final LocalAuthentication auth = LocalAuthentication();

  final List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();

  if (availableBiometrics.isNotEmpty) {
    Navigator.pop(context);
  }
}
