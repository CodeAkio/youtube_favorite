import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/video.dart';

const apiKey = "AIzaSyANSRlOtdE9h5r4V-yoV8MbY9rJLMN-tlQ";

class Api {
  search(String search) async {
    var uri = Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$apiKey&maxResults=10");
    var response = await http.get(uri);

    decode(response);
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      List<Video> videos =
          decoded["items"].map<Video>((map) => Video.fromJson(map)).toList();

      return videos;
    } else {
      throw Exception("Failed to load videos");
    }
  }
}

// "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
// "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
