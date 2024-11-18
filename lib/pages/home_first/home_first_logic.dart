import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/db_restorative/db_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../db_restorative/home_entity.dart';

class HomeFirstLogic extends GetxController {
  DBHome dbHome = Get.find<DBHome>();

  List<HomeEntity> allList = [];
  List<HomeEntity> childrenList = [];
  List<HomeEntity> adultList = [];

  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      for (var item in allList) {
        if (DateTime.now().isAfter(item.finishTime) && item.hadWarn == 0) {
          Fluttertoast.showToast(msg: '${item.name} at time');
          item.hadWarn = 1;
          await dbHome.updateHome(item);
        }
      }
    });
  }

  void getData() async {
    allList = await dbHome.getHomeAllData();
    childrenList = await dbHome.getHomeAllData(type: 0);
    adultList = await dbHome.getHomeAllData(type: 1);
    update();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final needWarn = prefs.getBool('warning') ?? true;
    if (needWarn) {
      startTimer();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
