import 'package:flutter/material.dart';
import 'package:untitled/slivers_demo/sliver_header.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.red,
        child: CustomScrollView(
          slivers: [
            myAppBar(),
            SliverList(
              /// for use of scrollable column
              delegate: columItem(),

              ///  for use of listview builder
              ///  withSliverChildBuilderDelegate()
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.maxFinite,
                height: 200,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }

  myAppBar() {
    return SliverAppBar(
      title: const Text(
        'Flutter Slivers Demo',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      collapsedHeight: 56,
      floating: true,

      /// when true show the sliver in full height instant (when only tool bar showing it not load full bottom list than show the app bar)
      expandedHeight: 250,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60",
          fit: BoxFit.cover,
        ),
        title: Text("asdf", style: TextStyle(fontSize: 20)),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

  SliverChildDelegate withSliverChildBuilderDelegate() {
    return SliverChildBuilderDelegate(
      (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: double.maxFinite,
            height: 100,
            margin: const EdgeInsets.only(bottom: 15),
            color: Colors.blue,
          )),
      childCount: 200,
    );
  }

  SliverChildDelegate columItem() {
    return SliverChildListDelegate([
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
      Container(
        width: double.maxFinite,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        color: Colors.blue,
      ),
    ]);
  }
}
