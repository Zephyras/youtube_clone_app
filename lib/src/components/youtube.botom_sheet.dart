import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  const YoutubeBottomSheet({Key key}) : super(key: key);
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "만들기",
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: Get.back,
        )
      ],
    );
  }

  Widget _itemButton(
      {String icon,
      double iconSize,
      double borderSize,
      String label,
      Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            width: borderSize,
            height: borderSize,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.withOpacity(0.3)),
            child: SizedBox(
              width: borderSize,
              height: borderSize,
              child: SvgPicture.asset(
                "assets/svg/icons/$icon",
                width: iconSize,
                height: iconSize,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            SizedBox(height: 10),
            _itemButton(
              icon: "upload.svg",
              iconSize: 10,
              borderSize: 50,
              label: "동영상 업로드",
              onTap: () {
                print("동영상 업로드 기능");
              },
            ),
            SizedBox(height: 10),
            _itemButton(
              icon: "broadcast.svg",
              iconSize: 10,
              borderSize: 50,
              label: "동영상 업로드",
              onTap: () {
                print("실시간 스트리밍 시작 기능");
              },
            ),
          ],
        ),
      ),
    );
  }
}
