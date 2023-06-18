import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/home/model/check_in_model.dart';
import 'package:riyad/modules/home/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
      on<CkeckInEvent>(
      (event, emit) async {
        try {
          emit(CheckInLoading());
          final GenericResponse<ChickInModel> response =
              await HomeRepository.checkin();
          if (response.success) {
            emit(CheckInLoaded(chickInModel: response.result!));
          }
     
        else if (response.success==false) {
            emit(CheckInfailed(errorMessage: response.message));
          }
        } catch (e) {
          
          emit(CheckInfailed(errorMessage: e.toString()));
        }
      },
    );
  }
}
