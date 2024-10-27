import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationLogin extends AuthenticationEvent {
  final String username;
  final String password;

  AuthenticationLogin(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
