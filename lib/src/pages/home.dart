import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/components/custom_appbar.dart';
import 'package:youtube_clone_app/src/components/video_widget.dart';
import 'package:youtube_clone_app/src/controller/home_controller.dart';
import 'package:youtube_clone_app/src/models/video.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => CustomScrollView(
            slivers: [
              SliverAppBar(
                title: CustomAppBar(),
                floating: true,
                snap: true,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //page Route
                      Get.toNamed("/detail/2324235");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VideoWidget(
                          video: controller.youtubeResult.value.items[index]),
                    ),
                  );
                },
                childCount: controller.youtubeResult.value.items == null
                    ? 0
                    : controller.youtubeResult.value.items.length,
              ))
            ],
          )),
    );
  }
}
