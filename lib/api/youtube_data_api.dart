import 'dart:convert';
import 'package:http/http.dart' as http;

class YoutubeService {
  final String apiKey = 'AIzaSyA0DLPh28kaTELo5cocfh3YcfH7N383kE0';
  final String baseUrl = 'https://www.googleapis.com/youtube/v3';

  Future<List<dynamic>> fetchVideoList() async {
    final url = Uri.parse(
      '$baseUrl/videos?part=snippet&chart=mostPopular&maxResults=10&regionCode=KR&key=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
