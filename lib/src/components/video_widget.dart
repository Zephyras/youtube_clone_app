import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key key}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(
                    "https://yt3.ggpht.com/ytc/AKedOLQagIEl2WOUacXZ8WlCPvApoIouP9sNGkMIDVdQ=s88-c-k-c0x00ffffff-no-rj")
                .image,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "개남 유튜브 다시 보기개남 유튜브 다시 보기개남 유튜브 다시 보기개남 유튜브 다시 보기개남 유튜브 다시 보기개남 유튜브 다시 보기개남 유튜브 다시 보기",
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
                    "개발하는남자",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  Text(" · "),
                  Text(
                    "조회수 1000회",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Text(" · "),
                  Text(
                    "2021-02-13",
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
