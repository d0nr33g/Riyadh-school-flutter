part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  AuthLoadingState();
}

class AuthLoadedState extends AuthState {
  AuthLoadedState();
}

class AuthFailedState extends AuthState {
final  String error;
  AuthFailedState({required this.error});
}
