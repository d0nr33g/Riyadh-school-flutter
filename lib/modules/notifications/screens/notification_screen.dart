import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/notifications/bloc/notification_bloc.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationBloc notificationBloc;
  @override
  void initState() {
    notificationBloc = NotificationBloc();
    notificationBloc.add(GetNotificationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.blackColor),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          "Notifications",
          style: TextStyle(color: AppColors.blackColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<NotificationBloc, NotificationState>(
          bloc: notificationBloc,
          builder: (context, state) {
            if (state is NotificationLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else if (state is NotificationLoaded) {
              N.notificationLength=state.notificationModel.length;
              return ListView.builder(
                  itemCount: state.notificationModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          "${state.notificationModel[index].message!.title}",
                          style: AppTheme.latoTheme.titleSmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Row(
                          children: [
                            SvgPicture.asset(AppImages.clockActiveSvg),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                "${state.notificationModel[index].message!.body}")
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
class N{
  static int notificationLength=0;
}