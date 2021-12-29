import 'package:get/get.dart';
import 'package:youtube_clone_app/src/components/youtube.botom_sheet.dart';

enum RouteName {
  Home,
  Explore,
  Add,
  Subs,
  Library,
}

class RootController extends GetxService {
  static RootController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void chnagePageIndex(int selectedIndex) {
    if (RouteName.values[selectedIndex] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(selectedIndex);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(YoutubeBottomSheet());
  }
}
