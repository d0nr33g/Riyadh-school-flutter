part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState{
  CheckoutLoading();
}
class CheckoutLoaded extends CheckoutState{
  ChickOutModel chickOutModel;
 CheckoutLoaded({required this.chickOutModel});
}
class Checkoutfailed extends CheckoutState{
  String errorMessage;
  Checkoutfailed({required this.errorMessage});
}