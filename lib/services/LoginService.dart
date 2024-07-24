import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  final String baseUrl = 'https://d8b8-185-97-92-59.ngrok-free.app/api/Login';
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> loginUser(String emailOrPhoneNumber, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'EmailOrPhoneNumber': emailOrPhoneNumber,
        'Password': password,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var token = data['token'];
      var expiration =
          DateTime.now().add(Duration(minutes: 2)); // Set expiration time
      await _storeToken(token, expiration);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<void> _storeToken(String token, DateTime expiration) async {
    await _secureStorage.write(key: 'jwt', value: token);
    await _secureStorage.write(
        key: 'expiration', value: expiration.toIso8601String());
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'jwt');
  }

  Future<DateTime?> getTokenExpiration() async {
    String? expirationString = await _secureStorage.read(key: 'expiration');
    if (expirationString != null) {
      return DateTime.parse(expirationString);
    }
    return null;
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'jwt');
    await _secureStorage.delete(key: 'expiration');
  }

  Future<bool> isLoggedIn() async {
    var token = await getToken();
    var expiration = await getTokenExpiration();

    if (token != null && expiration != null) {
      return DateTime.now().isBefore(expiration);
    }
    return false;
  }
}
