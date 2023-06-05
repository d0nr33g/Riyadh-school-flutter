import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_theme.dart';

Future<void> showLanguageDialog(context) async {
  bool isEnglish = true;
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
                      "Language",
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
                                isEnglish = true;
                                  Navigator.pop(context);
                                   changeLocale(context, "en");
                              });
                            },
                            child: Container(
                              height: 126,
                              decoration: BoxDecoration(
                                  color:
                                      isEnglish ? AppColors.primaryColor : null,
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
                                              color: isEnglish
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
                                            color: isEnglish
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
                                isEnglish = false;
                                Navigator.pop(context);
                                changeLocale(context, "ar");
                              });
                            },
                            child: Container(
                              height: 126,
                              decoration: BoxDecoration(
                                  color: !isEnglish
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
                                              color: !isEnglish
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
                                            color: !isEnglish
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
