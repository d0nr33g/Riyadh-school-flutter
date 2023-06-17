import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/modules/attendance/bloc/bloc/daily_attend_bloc.dart';
import 'package:riyad/modules/home/bloc/home_bloc/home_bloc.dart';

class CheckInComponent extends StatefulWidget {
  DailyAttendBloc dailyAttendBloc;
  CheckInComponent(this.dailyAttendBloc, {super.key});

  @override
  State<CheckInComponent> createState() => _CheckInComponentState();
}

class _CheckInComponentState extends State<CheckInComponent> {
  late HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = HomeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is CheckInfailed) {
          var snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is CheckInLoaded) {
          widget.dailyAttendBloc.add(GetDaylyAttendance());
        }
        return Column(
          children: [
            InkWell(
                onTap: () {
                  homeBloc.add(CkeckInEvent());
                },
                child: SvgPicture.asset(AppImages.checkineSvg)),
          ],
        );
      },
    );
  }
}
