import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone_app/src/controller/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailController extends GetxController {
  VideoController videoController;
  YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters["videoId"]);
    youtubePlayerController = DetailController() as YoutubePlayerController;
    super.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  String get title => videoController.video.snippet.title;
  String get publishedTime =>
      DateFormat("yyy-MM-dd").format(videoController.video.snippet.publishTime);
  String get discription => videoController.video.snippet.description;
  String get likeCount => videoController.statistics.value.likeCount;
  String get dislikeCount => videoController.statistics.value.dislikeCount;
  String get viewCount => videoController.statistics.value.viewCount;
  String get youtuberThumbnailUrl => videoController.youtuberThumbnailUrl;
  String get youtuberName => videoController.youtuber.value.snippet.title;
  String get subscriberCount =>
      videoController.youtuber.value.statistics.subscriberCount;
}
