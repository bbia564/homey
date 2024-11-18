import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/pages/home_first/homeItem.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../db_restorative/home_entity.dart';
import 'adult_home_logic.dart';

class AdultHomePage extends StatefulWidget {
  AdultHomePage(this.list, {Key? key}) : super(key: key);

  final List<HomeEntity> list;

  @override
  State<AdultHomePage> createState() => _AdultHomePageState();
}

class _AdultHomePageState extends State<AdultHomePage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<AdultHomeLogic>();

  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? Center(
            child: <Widget>[
              Image.asset(
                'assets/noData.webp',
                width: 55,
                height: 71,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'No data',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
          )
        : ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              return HomeItem(widget.list[index]);
            });
  }

  @override
  bool get wantKeepAlive => true;
}
