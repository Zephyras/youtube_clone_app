import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:youtube_clone_app/src/controller/app_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
