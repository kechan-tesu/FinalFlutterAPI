import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;
import '../models/episode.dart'; // Assuming you have a model for your episodes

class ApiService {
  // API URL defined here as a constant
  static const String apiUrl =
      "https://jsonplaceholder.typicode.com/posts"; // Replace with your actual API

  // Fetch episodes or posts from the API
  static Future<List<Episode>> fetchEpisodes() async {
    try {
      final response =
          await http.get(Uri.parse(apiUrl)); // Fetching data from the URL

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Episode.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load episodes: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error fetching episodes.");
    }
  }
}
