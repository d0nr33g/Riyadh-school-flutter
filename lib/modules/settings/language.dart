import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_theme.dart';

Future<void> showLanguageDialog(context) async {
  //bool isEnglish = true;
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              content: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "language".tr(),
                      style: AppTheme.latoTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                              //  isEnglish = true;
                                  Navigator.pop(context);
                                  // changeLocale(context, "en");
                                   context.setLocale(Locale('en', 'US'));
                              });
                            },
                            child: Container(
                              height: 126,
                              decoration: BoxDecoration(
                                  color:
                                      context.locale==Locale('en', 'US') ? AppColors.primaryColor : null,
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: AppColors.textColor)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xffEFF5F4),
                                    radius: 30,
                                    child: Text(
                                      "EN",
                                      style: AppTheme.latoTheme.bodyMedium!
                                          .copyWith(
                                              color:   context.locale==Locale('en', 'US')
                                                  ? AppColors.primaryColor
                                                  : AppColors.textColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "English",
                                    style: AppTheme.latoTheme.bodyMedium!
                                        .copyWith(
                                            color:   context.locale==Locale('en', 'US')
                                                ? AppColors.whiteColor
                                                : AppColors.textColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                             
                                Navigator.pop(context);
                               // changeLocale(context, "ar");
                               context.setLocale(Locale('ar', 'EG'));

                              });
                            },
                            child: Container(
                              height: 126,
                              decoration: BoxDecoration(
                                  color:   context.locale!=Locale('en', 'US')
                                      ? AppColors.primaryColor
                                      : null,
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: AppColors.textColor)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xffEFF5F4),
                                    radius: 30,
                                    child: Text(
                                      "AR",
                                      style: AppTheme.latoTheme.bodyMedium!
                                          .copyWith(
                                              color:  context.locale!=Locale('en', 'US')
                                                  ? AppColors.primaryColor
                                                  : AppColors.textColor),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Arabic",
                                    style: AppTheme.latoTheme.bodyMedium!
                                        .copyWith(
                                            color:   context.locale!=Locale('en', 'US')
                                                ? AppColors.whiteColor
                                                : AppColors.textColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ));
        },
      );
    },
  );
}
