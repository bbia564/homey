import 'package:get/get.dart';

import 'adult_home_logic.dart';

class AdultHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdultHomeLogic());
  }
}
