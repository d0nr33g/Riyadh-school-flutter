import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/attendance/model/attendance_model.dart';
import 'package:riyad/modules/attendance/repository/attendace_repo.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitial()) {
    on<GetWeeklyAttendance>(
        (GetWeeklyAttendance event, Emitter<AttendanceState> emit) async {
      try {
        emit(AttendanceLoading());
        final GenericResponse<AttendanceModel> response =
            await AuttendaceRepository.getWeekAttendance();
        if (response.success) {
          
          emit(AttendanceLoaded(attendWeekList: response.results!));
        }
      } catch (e) {
        emit(AttendanceFailed(errorMessage: e.toString()));
      }
    });
  }
}
