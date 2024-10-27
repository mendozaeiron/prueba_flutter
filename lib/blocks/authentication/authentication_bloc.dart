import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_flutter/repositories/authentication_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

/// `AuthenticationBloc` maneja el flujo de autenticación en la aplicación.
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc(this.authenticationRepository) : super(AuthenticationInitial()) {
    // Usar el método 'on' para manejar el evento de autenticación
    on<AuthenticationLogin>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final user = await authenticationRepository.authenticate(event.username, event.password);
        emit(AuthenticationSuccess(user!));
      } catch (error) {
        emit(AuthenticationFailure('Error en la autenticación. Credenciales de usuario ingresadas no existen'));
      }
    });
  }
}

