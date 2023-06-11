import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClockCubit extends Cubit<DateTime> {
  late Timer _timer;

  ClockCubit() : super(DateTime.now()) {
    _timer = Timer.periodic(Duration(seconds: 1), (_) => emit(DateTime.now()));
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
