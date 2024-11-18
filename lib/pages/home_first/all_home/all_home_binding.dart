import 'package:get/get.dart';

import 'all_home_logic.dart';

class AllHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllHomeLogic());
  }
}
