import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone_app/src/controller/video_controller.dart';
import 'package:youtube_clone_app/src/models/video.dart';

class VideoWidget extends StatefulWidget {
  final Video video;
  const VideoWidget({
    Key key,
    this.video,
  }) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController _videoController;

  @override
  void initState() {
    //tag 고유의 값을 지정해줄수 있다. videoId로 개별적 관리를 할 수 있다.
    Get.put(VideoController(video: widget.video), tag: widget.video.id.videoId);
    super.initState();
  }

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(
        widget.video.snippet.thumbnails.medium.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage:
                  Image.network(_videoController.youtuberThumbnailUrl).image,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.video.snippet.title,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, size: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.video.snippet.channelTitle.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  Text(" · "),
                  Container(
                    child: Text(
                      //"조회수 1000 회",
                      "조회수 ${_videoController.statistics.value.viewCount}회",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                  Text(" · "),
                  Text(
                    DateFormat("yyyy-MM-dd")
                        .format(widget.video.snippet.publishTime),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }
}
