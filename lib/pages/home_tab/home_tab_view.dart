import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/pages/home_add/home_add_view.dart';
import 'package:home_restoratives/pages/home_first/home_first_logic.dart';
import 'package:home_restoratives/pages/home_first/home_first_view.dart';
import 'package:home_restoratives/pages/home_second/home_second_view.dart';

import '../../main.dart';
import 'home_tab_logic.dart';

class HomeTabPage extends GetView<HomeTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          const HomeFirstPage(),
          HomeAddPage(),
          HomeSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navHomeBars()),
    );
  }

  Widget _navHomeBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Default.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Default.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'About',
        )
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/homeAdd')?.then((_) {
            HomeFirstLogic homeFirstLogic = Get.find<HomeFirstLogic>();
            homeFirstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
