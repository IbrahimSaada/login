import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostService {
  static const String apiUrl =
      'http://development.eba-pue89yyk.eu-central-1.elasticbeanstalk.com/api/Posts';

  static Future<List<Post>> fetchPosts() async {
    // Changed to static method
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
