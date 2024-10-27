import 'package:equatable/equatable.dart';
import 'package:prueba_flutter/models/user.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  final User user;
  AuthenticationSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String error;
  AuthenticationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
