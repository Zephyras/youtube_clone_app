import 'package:youtube_clone_app/src/models/statistics.dart';
import 'package:youtube_clone_app/src/models/video.dart';

class Youtuber {
  Youtuber({
    this.snippet,
    this.statistics,
  });
  Snippet snippet;
  Statistics statistics;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
        snippet: Snippet.fromJson(json["snippet"]),
        statistics: Statistics.fromJson(json["statistics"]),
      );
}

class YoutuberSnippet {
  YoutuberSnippet({
    this.title,
    this.description,
    this.customUrl,
    this.publishedAt,
    this.thumbnails,
    this.localized,
    this.country,
  });
  String title;
  String description;
  String customUrl;
  DateTime publishedAt;
  Thumbnails thumbnails;
  Localized localized;
  String country;
  factory YoutuberSnippet.fromJson(Map<String, dynamic> json) =>
      YoutuberSnippet(
        title: json["title"],
        description: json["description"],
        customUrl: json["customUrl"] == null ? "" : json["customUrl"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        localized: Localized.fromJson(json["localized"]),
        country: json["country"] == null ? "" : json["country"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "customUrl": customUrl,
        "publishedAt": publishedAt.toIso8601String(),
        "thumbnails": thumbnails.toJson(),
        "localized": localized.toJson(),
        "country": country,
      };
}

class Localized {
  Localized({
    this.title,
    this.description,
  });

  String title;
  String description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class YoutuberStatistics {
  YoutuberStatistics({
    this.viewCount,
    this.subscriberCount,
    this.hiddenSubscriberCount,
    this.videoCount,
  });

  String viewCount;
  String subscriberCount;
  bool hiddenSubscriberCount;
  String videoCount;

  factory YoutuberStatistics.fromJson(Map<String, dynamic> json) =>
      YoutuberStatistics(
        viewCount: json["viewCount"],
        subscriberCount:
            json["subscriberCount"] == null ? "" : json["subscriberCount"],
        hiddenSubscriberCount: json["hiddenSubscriberCount"] == null
            ? ""
            : json["hiddenSubscriberCount"],
        videoCount: json["videoCount"] == null ? "" : json["videoCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "subscriberCount": subscriberCount,
        "hiddenSubscriberCount": hiddenSubscriberCount,
        "videoCount": videoCount,
      };
}
