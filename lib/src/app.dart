import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone_app/src/controller/root_controller.dart';
import 'package:youtube_clone_app/src/pages/explore.dart';
import 'package:youtube_clone_app/src/pages/Home/home.dart';
import 'package:youtube_clone_app/src/pages/library.dart';
import 'package:youtube_clone_app/src/pages/subscribe.dart';

import 'controller/app_controller.dart';

class App extends GetView<AppController> {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // 값을 받아는 상황에따라서 분기시켜주기
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Home:
            return Home();
            break;
          case RouteName.Explore:
            return Explore();
            break;
          case RouteName.Add:
            // TODO:   bottomSheet 나오게 하기.
            break;
          case RouteName.Subs:
            return Subscribe();
            break;
          case RouteName.Library:
            return Library();
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: (index) {
            //AppController.to.changePageIndex(index);
            controller.changePageIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/compass_off.svg",
                width: 22,
                height: 22,
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/icons/compass_on.svg",
                width: 22,
                height: 22,
              ),
              label: "탐색",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/svg/icons/plus.svg",
                  width: 35,
                  height: 35,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/icons/subs_off.svg",
              ),
              activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
              label: "구독",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
              activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
              label: "보관함",
            ),
          ],
        ),
      ),
    );
  }
}
