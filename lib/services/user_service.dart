import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class UserService {
  final String baseUrl = 'https://localhost:7002/api/Users';

  Future<void> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
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

    if (response.statusCode != 201) {
      throw Exception('Failed to register user: ${response.body}');
    }
  }

  Future<bool> emailExists(String email) async {
    final response = await http.get(
      Uri.parse('$baseUrl/email-exists/$email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return response.body == 'true';
    } else {
      throw Exception('Failed to check email: ${response.body}');
    }
  }

  Future<bool> phoneExists(String phoneNumber) async {
    final response = await http.get(
      Uri.parse('$baseUrl/phone-exists/$phoneNumber'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return response.body == 'true';
    } else {
      throw Exception('Failed to check phone number: ${response.body}');
    }
  }
}
