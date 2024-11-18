import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../db_restorative/home_entity.dart';
import '../homeItem.dart';
import 'children_home_logic.dart';

class ChildrenHomePage extends StatefulWidget {
  ChildrenHomePage(this.list,{Key? key}) : super(key: key);

  final List<HomeEntity> list;

  @override
  State<ChildrenHomePage> createState() => _ChildrenHomePageState();
}

class _ChildrenHomePageState extends State<ChildrenHomePage> with AutomaticKeepAliveClientMixin {
  final controller = Get.find<ChildrenHomeLogic>();

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