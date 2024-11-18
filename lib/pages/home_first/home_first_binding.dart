import 'package:get/get.dart';

import 'home_first_logic.dart';

class HomeFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeFirstLogic());
  }
}
