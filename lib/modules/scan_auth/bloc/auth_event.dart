part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
final  String qrScan;
  LoginEvent({required this.qrScan});
}
