import 'dart:async';

import 'package:flutter/material.dart';

class BottomNaviView extends StatefulWidget {
  BottomNaviView({Key? key}) : super(key: key);

  @override
  State<BottomNaviView> createState() => _BottomNaviViewState();
}

class _BottomNaviViewState extends State<BottomNaviView> with TickerProviderStateMixin {
  List<Widget> list = [
    Icon(Icons.add),
    Icon(Icons.remove),
    Icon(Icons.device_hub),
    Icon(Icons.security_outlined),
    Icon(Icons.admin_panel_settings),
  ];

  int index = 0;

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 4, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Bottom Navigation", style: TextStyle()),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 60,
          child: Material(
            color: Colors.red,
            child: TabBar(
              indicatorPadding: EdgeInsets.only(bottom: 50, right: 20, left: 20),
              indicator: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              labelPadding: EdgeInsets.zero,
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(fontSize: 11, fontFamily: "Regular"),
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  height: 45,
                  text: "Radio station",
                  iconMargin: EdgeInsets.all(2),
                ),
                Tab(
                  iconMargin: EdgeInsets.all(2),
                  icon: Icon(Icons.home),
                  text: "Hot Offer",
                ),
                Tab(
                  icon: Icon(Icons.home),
                  text: "My Cart",
                  iconMargin: EdgeInsets.all(2),
                ),
                Tab(
                  iconMargin: EdgeInsets.all(2),
                  icon: Icon(Icons.home),
                  text: "Profile",
                ),
                Tab(
                  icon: Icon(Icons.home),
                  height: 45,
                  text: "Home",
                  iconMargin: EdgeInsets.all(2),
                ),

              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.pink,
        width: double.maxFinite,
        height:double.maxFinite,
      ),
    );
  }

  Widget bottomView() {
    return Container(
      height: 56,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            list.length,
            (index) => Column(
                  children: [
                    Container(
                      child: list[index],
                    ),
                    Text("my ", style: TextStyle()),
                  ],
                )),
      ),
    );
  }
}

class Model {
  final String title;
  final String icon;
  final bool selected;

  Model({required this.title, required this.selected, required this.icon});
}
