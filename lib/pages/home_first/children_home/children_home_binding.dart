import 'package:get/get.dart';

import 'children_home_logic.dart';

class ChildrenHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChildrenHomeLogic());
  }
}
