import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

// Fired just after the app is launched
class AppLoadedup extends AuthenticationEvent {}

class UserLogOut extends AuthenticationEvent {}

class GetUserData extends AuthenticationEvent {}

class UserReset extends AuthenticationEvent {
  final String userId;
  UserReset({@required this.userId});

  @override
  List<Object> get props => [userId];
}

class UserLogin extends AuthenticationEvent {
  final String loginId;
  final String password;
  UserLogin({@required this.loginId, this.password});

  @override
  List<Object> get props => [loginId, password];
}
