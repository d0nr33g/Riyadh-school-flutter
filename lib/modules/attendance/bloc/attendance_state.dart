part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {
  AttendanceLoading();
}

class AttendanceLoaded extends AttendanceState {
  List<AttendanceModel> attendWeekList = [];
  AttendanceLoaded({required this.attendWeekList});
}

class AttendanceFailed extends AttendanceState {
  String errorMessage;
  AttendanceFailed({required this.errorMessage});
}
