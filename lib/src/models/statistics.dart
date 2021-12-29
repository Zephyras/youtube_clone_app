import 'dart:convert';

Statistics statisticsFromJson(String str) =>
    Statistics.fromJson(json.decode(str));

String statisticsToJson(Statistics data) => json.encode(data.toJson());

class Statistics {
  Statistics({
    this.viewCount = "0",
    this.likeCount = "0",
    this.dislikeCount = "0",
    this.favoriteCount = "0",
    this.commentCount = "0",
    this.subscriberCount = "0",
  });

  String viewCount;
  String likeCount;
  String dislikeCount;
  String favoriteCount;
  String commentCount;
  String subscriberCount;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"] == null ? "" : json["likeCount"],
        dislikeCount: json["dislikeCount"] == null ? "" : json["dislikeCount"],
        favoriteCount:
            json["favoriteCount"] == null ? "" : json["favoriteCount"],
        commentCount: json["commentCount"] == null ? "" : json["commentCount"],
        subscriberCount:
            json["subscriberCount"] == null ? "" : json["subscriberCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "dislikeCount": dislikeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
        "subscriberCount": subscriberCount,
      };
}
