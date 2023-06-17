import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riyad/core/app_images.dart';
import 'package:riyad/modules/attendance/bloc/bloc/daily_attend_bloc.dart';
import 'package:riyad/modules/home/bloc/bloc/checkout_bloc.dart';

class CheckOutComponent extends StatefulWidget {
  DailyAttendBloc dailyAttendBloc;
  CheckOutComponent(this.dailyAttendBloc, {super.key});

  @override
  State<CheckOutComponent> createState() => _CheckOutComponentState();
}

class _CheckOutComponentState extends State<CheckOutComponent> {
  late CheckoutBloc checkoutBloc;
  @override
  void initState() {
    checkoutBloc = CheckoutBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      bloc:checkoutBloc ,
      builder: (context, state) {
        if (state is Checkoutfailed) {
          var snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is CheckoutLoaded) {
          widget.dailyAttendBloc.add(GetDaylyAttendance());
        }
        return Column(
          children: [
            InkWell(
                onTap: () {
                  checkoutBloc.add(CkeckOutEvent());
                },
                child: SvgPicture.asset(AppImages.checkoutSvg)),
          ],
        );
      },
    );
  }
}
