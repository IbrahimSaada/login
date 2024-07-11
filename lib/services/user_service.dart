import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class UserService {
  Future<void> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('https://localhost:7002/api/Users/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'fullName': user.fullName,
        'email': user.email,
        'phone_number': user.phoneNumber,
        'gender': user.gender,
        'dob': user.dob.toIso8601String(),
        'password': user.password,
      }),
    );

    if (response.statusCode == 201) {
      // Registration successful
    } else {
      // Registration failed
      String errorMessage;
      try {
        final errorResponse = jsonDecode(response.body);
        errorMessage = errorResponse['title'] ?? 'Unknown error';
        if (errorResponse['errors'] != null) {
          errorMessage = errorResponse['errors'].values.join('\n');
        }
      } catch (e) {
        errorMessage = 'Failed to register user';
      }
      throw Exception(errorMessage);
    }
  }
}
