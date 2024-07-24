import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService {
  final String baseUrl = 'https://localhost:7002/api/Login';

  Future<Map<String, dynamic>> loginUser(
      String emailOrPhoneNumber, String password) async {
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
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}
