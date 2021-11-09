import 'package:get/get.dart';

//App 처음 화면은 항상 켜져 잇고 꺼지지 않는 화면이라서 GetxService로 해준다.
class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
