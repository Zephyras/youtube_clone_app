import 'package:youtube_clone_app/src/models/video.dart';

class YoutubeVideoResult {
  int totalResults;
  int resultsPerPage;
  String nextPageToken;
  List<Video> items;

  YoutubeVideoResult({
    this.totalResults = 0,
    this.resultsPerPage = 0,
    this.nextPageToken = "",
    this.items = const [],
  });

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) {
    return YoutubeVideoResult(
      totalResults: json["pageInfo"]["totalResults"],
      resultsPerPage: json['pageInfo']['resultsPerPage'],
      nextPageToken: json['nextPageToken'] ?? "",
      items: List<Video>.from(
        json["items"].map(
          (data) => Video.fromJson(data),
        ),
      ).toList(),
    );
  }
}
