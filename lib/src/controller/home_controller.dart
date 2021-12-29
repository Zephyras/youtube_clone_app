import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/models/youtube_video_result.dart';
import 'package:youtube_clone_app/src/repository/youtube_repository.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void _videoLoad() async {
    YoutubeVideoResult result = await YoutubeRepository.to
        .loadVideos(youtubeResult.value.nextPageToken);

    if (result != null && result.items.length > 0) {
      youtubeResult.update((youtube) {
        youtube.nextPageToken = result.nextPageToken;
        youtube.items.addAll(result.items);
      });
    }
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPageToken.isNotEmpty) {
        _videoLoad();
      }
    });
  }
}
