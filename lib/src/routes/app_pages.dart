import 'package:get/get.dart';
import 'package:youtube_clone_app/src/app.dart';
import 'package:youtube_clone_app/src/components/youtube_detail.dart';
import 'package:youtube_clone_app/src/controller/detail_controller.dart';
import 'package:youtube_clone_app/src/controller/search_controller.dart';
import 'package:youtube_clone_app/src/pages/Home/search.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => App()),
    GetPage(
      name: "${Routes.DETAIL}:videoId",
      page: () => YoutubeDetail(),
      binding: BindingsBuilder(
        () => Get.lazyPut<DetailController>(
          () => DetailController(),
        ),
      ),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => YoutubeSearch(),
      binding: BindingsBuilder(
        () => Get.lazyPut<YoutubeSearchController>(
            () => YoutubeSearchController()),
      ),
    ),
  ];
}
