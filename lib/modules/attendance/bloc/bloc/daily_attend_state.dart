part of 'daily_attend_bloc.dart';

abstract class DailyAttendState {}

class DailyAttendInitial extends DailyAttendState {}

class DayAttendanceLoading extends DailyAttendState {
  DayAttendanceLoading();
}

class DayAttendanceLoaded extends DailyAttendState {
  DayAttendaceModel attendDay;
  DayAttendanceLoaded({required this.attendDay});
}

class DayAttendanceFailed extends DailyAttendState {
  String errorMessage;
  DayAttendanceFailed({required this.errorMessage});
}