part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class CheckInLoading extends HomeBloc{
  CheckInLoading();
}
class CheckInLoaded extends HomeBloc{
  CheckInLoaded();
}
class CheckInfailed extends HomeBloc{
  String errorMessage;
  CheckInfailed({required this.errorMessage});
}