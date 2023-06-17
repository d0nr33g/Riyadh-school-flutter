import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:riyad/core/app_colors.dart';
import 'package:riyad/core/app_theme.dart';
import 'package:riyad/modules/home/bloc/clock_cubit.dart';

class ClockComponent extends StatefulWidget {
  const ClockComponent({super.key});

  @override
  State<ClockComponent> createState() => _ClockComponentState();
}

class _ClockComponentState extends State<ClockComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClockCubit, DateTime>(
      builder: (context, state) {
        return Column(
          children: [
            Text("${DateFormat('hh:mm a').format(state)}",
                textAlign: TextAlign.center,
                style: AppTheme.latoTheme.displayLarge!.copyWith(fontSize: 51)),
            Text(
              "${DateFormat('EEEE, MMM d').format(state)}",
              textAlign: TextAlign.center,
              style: AppTheme.latoTheme.displayLarge!
                  .copyWith(fontSize: 25, color: AppColors.textColor),
            ),
          ],
        );
      },
    );
  }
}
