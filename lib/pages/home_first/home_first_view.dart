import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/pages/home_first/all_home/all_home_view.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'adult_home/adult_home_view.dart';
import 'children_home/children_home_view.dart';
import 'home_first_logic.dart';

class HomeFirstPage extends StatefulWidget {
  const HomeFirstPage({Key? key}) : super(key: key);

  @override
  State<HomeFirstPage> createState() => _HomeFirstPageState();
}

class _HomeFirstPageState extends State<HomeFirstPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final controller = Get.find<HomeFirstLogic>();

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home medicine",
          style: TextStyle(color: Colors.white),
        ),
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
        child: <Widget>[
          Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15),
            child: SizedBox(
              width: double.infinity,
              child: Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    useMaterial3: true,
                    tabBarTheme:
                    const TabBarTheme(
                        indicatorColor: Colors.transparent)),
                child: TabBar(
                  tabAlignment: TabAlignment.fill,
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  indicatorColor: Colors.white,
                  indicatorWeight: 4,
                  tabs: const [
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Tab(
                          text: "All",
                        )),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Tab(
                          text: "Children",
                        )),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Tab(
                          text: "Adult",
                        ))
                  ],
                ),
              ),
            ),
          ).decorated(
              color: primaryColor),
          const SizedBox(height: 10,),
          Expanded(child: GetBuilder<HomeFirstLogic>(builder: (_) {
            return SafeArea(
              child: TabBarView(
                controller: _tabController,
                children: [
                  AllHomePage(controller.allList),
                  ChildrenHomePage(controller.childrenList),
                  AdultHomePage(controller.adultList),
                ],
              ),
            );
          }).marginAll(15))
        ].toColumn(),
      ),
    );
  }
}
