import 'dart:convert';
import 'package:app_007_learn_bloc_api/home_screen/model/post.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  final String apiUrl = "https://dummyjson.com/posts";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)["posts"];
      return jsonResponse.map((post) => Post.fromMap(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}