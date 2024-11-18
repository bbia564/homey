import 'package:get/get.dart';

import 'home_add_logic.dart';

class HomeAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeAddLogic());
  }
}
