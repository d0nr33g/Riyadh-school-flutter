part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class CheckInLoading extends HomeState{
  CheckInLoading();
}
class CheckInLoaded extends HomeState{
  ChickInModel chickInModel;
  CheckInLoaded({required this.chickInModel});
}
class CheckInfailed extends HomeState{
  String errorMessage;
  CheckInfailed({required this.errorMessage});
}