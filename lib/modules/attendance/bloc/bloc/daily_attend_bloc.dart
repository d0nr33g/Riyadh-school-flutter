import 'package:bloc/bloc.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/attendance/model/day_attend_model.dart';
import 'package:riyad/modules/attendance/repository/attendace_repo.dart';

part 'daily_attend_event.dart';
part 'daily_attend_state.dart';

class DailyAttendBloc extends Bloc<DailyAttendEvent, DailyAttendState> {
  DailyAttendBloc() : super(DailyAttendInitial()) {
      on<GetDaylyAttendance>(
      (event, emit) async {
        try {
          emit(DayAttendanceLoading());
          final GenericResponse<DayAttendaceModel> response =
              await AuttendaceRepository.getdayAttendance();
          if (response.success) {
            emit(DayAttendanceLoaded(attendDay: response.result!));
          }
        } catch (e) {
          emit(DayAttendanceFailed(errorMessage: e.toString()));
        }
      },
    );
  }
}
