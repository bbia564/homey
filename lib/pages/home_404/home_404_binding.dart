import 'package:get/get.dart';

import 'home_404_logic.dart';

class Home404Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
