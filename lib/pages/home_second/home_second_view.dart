import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:styled_widget/styled_widget.dart';


import '../home_first/home_first_logic.dart';
import 'home_second_logic.dart';

class HomeSecondPage extends GetView<HomeSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = [
      'Clean all records',
      'Deadline warning',
      'About Us'
    ];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 1
            ? Obx(() {
          return Switch(
              value: controller.warning.value,
              activeTrackColor: Colors.green,
              onChanged: (value) async {
                controller.warning.value = value;
                final SharedPreferences prefs =
                await SharedPreferences.getInstance();
                await prefs.setBool('warning', value);
                HomeFirstLogic homeFirstLogic = Get.find<HomeFirstLogic>();
                homeFirstLogic.getData();
              });
        })
            : const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.black,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanHomeData();
          break;
        case 1:
          break;
        case 2:
          controller.aboutHomeUS(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About", style: TextStyle(color: Colors.white),),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        actions: [
          const Icon(
            Icons.add_circle,
            size: 30,
            color: Colors.white,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/homeAdd')?.then((_) {
              HomeFirstLogic homeFirstLogic = Get.find<HomeFirstLogic>();
              homeFirstLogic.getData();
            });
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    _item(0, context),
                    _item(1, context),
                    _item(2, context),
                  ].toColumn(
                      separator: Divider(
                        height: 15,
                        color: Colors.grey.withOpacity(0.3),
                      )),
                ).decorated(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12))
              ].toColumn(),
            ).marginAll(15)),
      ),
    );
  }
}
