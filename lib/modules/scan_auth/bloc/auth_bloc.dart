import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riyad/core/app_shared.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/scan_auth/model/auth_model.dart';
import 'package:riyad/modules/scan_auth/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((LoginEvent event, Emitter<AuthState> emit) async {
                  SharedPreferences pref=await SharedPreferences.getInstance();

      try {
        emit(AuthLoadingState());
        final GenericResponse<AuthModel> response = await AuthRepository.loginUser(event.qrScan);
          if (response.success) {
             pref.setString("userToken",response.result!.accessToken!);
              pref.setString("userName","${response.result!.firstName!}${response.result!.lastName!}");
              pref.setString("userId",response.result!.sId!);
              emit(AuthLoadedState());
          }
      } catch (e) {
        emit(AuthFailedState(error: e.toString()));
      }
    });
  }
}
