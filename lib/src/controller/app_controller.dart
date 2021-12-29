import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/app.dart';
import 'package:youtube_clone_app/src/components/youtube.botom_sheet.dart';
import 'package:youtube_clone_app/src/controller/root_controller.dart';

//App 처음 화면은 항상 켜져 잇고 꺼지지 않는 화면이라서 GetxService로 해준다.
class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    //다른곳에
    Get.bottomSheet(YoutubeBottomSheet());
  }
}
