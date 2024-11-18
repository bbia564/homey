import 'package:get/get.dart';

import '../home_add/home_add_logic.dart';
import '../home_first/adult_home/adult_home_logic.dart';
import '../home_first/all_home/all_home_logic.dart';
import '../home_first/children_home/children_home_logic.dart';
import '../home_first/home_first_logic.dart';
import '../home_second/home_second_logic.dart';
import 'home_tab_logic.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTabLogic());
    Get.lazyPut(() => HomeFirstLogic());
    Get.lazyPut(() => HomeSecondLogic());
    Get.lazyPut(() => HomeAddLogic());
    Get.lazyPut(() => AllHomeLogic());
    Get.lazyPut(() => ChildrenHomeLogic());
    Get.lazyPut(() => AdultHomeLogic());
  }
}
