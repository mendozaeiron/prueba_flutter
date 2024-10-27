import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocks/authentication/authentication_bloc.dart';
import '../blocks/authentication/authentication_event.dart';
import '../blocks/authentication/authentication_state.dart';

/// `LoginScreen` representa la pantalla de inicio de sesión donde el usuario ingresa su nombre de usuario y contraseña.
class LoginScreen extends StatelessWidget {
  // Controladores para capturar el texto ingresado en los campos de usuario y contraseña
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 // Constructor para `LoginScreen`
 LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')), // Título de la pantalla
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          // Verifica el estado de autenticación y redirige o muestra errores según corresponda
          if (state is AuthenticationSuccess) {
            // Redirige a la pantalla de productos si la autenticación es exitosa
            Navigator.pushNamed(context, '/products');
          } else if (state is AuthenticationFailure) {
            // Muestra un mensaje de error si la autenticación falla
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo de entrada para el nombre de usuario
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Nombre de usuario'),
              ),
              const SizedBox(height: 16),
              // Campo de entrada para la contraseña
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true, // Oculta el texto para mayor seguridad
              ),
              const SizedBox(height: 24),
              // Botón para iniciar sesión
              ElevatedButton(
                onPressed: () {
                  // Verifica los campos de usuario y contraseña antes de autenticar
                  if (_usernameController.text.isEmpty && _passwordController.text.isEmpty) {
                    // Mensaje de error si faltan ambos campos
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Campos vacios. Favor de ingresar sus credenciales')),
                    );
                  } else if (_usernameController.text.isEmpty) {
                    // Mensaje de error si falta el nombre de usuario
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, ingrese el nombre de usuario')),
                    );
                  } else if (_passwordController.text.isEmpty) {
                    // Mensaje de error si falta la contraseña
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, ingrese la contraseña')),
                    );
                  } else {
                    // Envía el evento de autenticación con las credenciales si ambos campos están completos
                    context.read<AuthenticationBloc>().add(
                      AuthenticationLogin(
                        _usernameController.text,
                        _passwordController.text,
                      ),
                    );
                  }
                },
                child: const Text('Iniciar sesión'), // Etiqueta del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
