import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/controller/search_controller.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  YoutubeSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: SvgPicture.asset("assets/svg/icons/back.svg"),
        ),
      ),
    );
  }
}
