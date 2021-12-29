import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_clone_app/src/models/youtube_video_result.dart';
import 'package:youtube_clone_app/src/repository/youtube_repository.dart';

class YoutubeSearchController extends GetxController {
  SharedPreferences profs;
  ScrollController scrollController;

  String key = "SearchKey";
  String currentKeyword = "";
  RxList<String> history = <String>[].obs;
  Rx<YoutubeVideoResult> youtubeVideoResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() async {
    profs = await SharedPreferences.getInstance();
    List<String> initData = profs.getStringList(key) ?? [""];
    history(initData.map((e) => e.toString()).toList());
    _event();
    super.onInit();
  }

  void search(String keyword) {
    history.addIf(!history.contains(keyword), keyword);
    profs.setStringList(key, history);
    currentKeyword = keyword;
    if (youtubeVideoResult.value.items.isNotEmpty) {
      youtubeVideoResult.value.items.clear();
      scrollController.jumpTo(0.0);
    }
    _searchYoutube(keyword);
  }

  void _searchYoutube(String keyword) async {
    YoutubeVideoResult result = await YoutubeRepository.to
        .saerch(keyword, youtubeVideoResult.value.nextPageToken);

    if (result != null && result.items.length > 0) {
      youtubeVideoResult.update((youtube) {
        youtube.nextPageToken = result.nextPageToken;
        youtube.items.addAll(result.items);
      });
    }
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken.isNotEmpty) {
        _searchYoutube(currentKeyword);
      }
    });
  }
}
