import 'package:get/get.dart';

import 'home_second_logic.dart';

class HomeSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeSecondLogic());
  }
}
