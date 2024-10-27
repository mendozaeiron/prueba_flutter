import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthenticationRepository {
  Future<User?> authenticate(String username, String password) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User(username: username, token: data['token']);
    } else {
      throw Exception('Error en la autenticación');
    }
  }
}
