import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:riyad/core/general_response.dart';
import 'package:riyad/modules/home/model/checkout_model.dart';
import 'package:riyad/modules/home/repository/home_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
        on<CkeckOutEvent>(
      (event, emit) async {
        try {
          emit(CheckoutLoading());
          final GenericResponse<ChickOutModel> response =
              await HomeRepository.checkout();
          if (response.success) {
            emit(CheckoutLoaded(chickOutModel: response.result!));
          }
        } catch (e) {
          emit(Checkoutfailed(errorMessage: e.toString()));
        }
      },
    );
  }
}
