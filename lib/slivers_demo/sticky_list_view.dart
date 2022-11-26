import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/test_view.dart';

class StickyMultipleListView extends StatefulWidget {
  const StickyMultipleListView({Key? key}) : super(key: key);

  @override
  State<StickyMultipleListView> createState() => _StickyMultipleListViewState();
}

class _StickyMultipleListViewState extends State<StickyMultipleListView> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print("--  --resumed-----------.................");
    } else if (state == AppLifecycleState.inactive) {
      print("--  --inactive-----------.................");
    } else if (state == AppLifecycleState.paused) {
      print("--  --paused-----------.................");
    } else if (state == AppLifecycleState.detached) {
      print("--  --detached-----------.................");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          myAppBar(),
          gridViewList(),
          sliverPersistentHeaders("test 0000"),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "recipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructions",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          sliverPersistentHeaders("test 1111"),
          SliverList(
            delegate: SliverChildListDelegate(List.generate(
                15,
                (index) => Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "recipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructionsrecipe.instructions",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ))),
          ),
          sliverPersistentHeaders("test 2222"),
          gridViewList(),
        ],
      ),
    );
  }

  myAppBar() {
    return SliverAppBar(
      /*title: const Text(
        'Flutter Slivers Demo',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      ),*/
      collapsedHeight: 56,

      /// when true show the sliver in full height instant (when only tool bar showing it not load full bottom list than show the app bar)
      floating: true,
      expandedHeight: 250,

      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          "https://images.unsplash.com/photo-1603785608232-44c43cdc0d70?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEo5eXJQYUhYUlFZfHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60",
          fit: BoxFit.cover,
        ),
        title: const Text("asdf", style: TextStyle(fontSize: 20)),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

  gridViewList() {
    return SliverPadding(
      padding: const EdgeInsets.all(15),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4,
        ),
        // 2
        delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MySecondPage();
              }));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
              child: Text(
                "asdffsd",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          childCount: 20,
        ),
      ),
    );
  }

  Widget sliverPersistentHeaders(String s) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        // 2
        minHeight: 70,
        maxHeight: 70,
        // 3
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              s,
              style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

class MySecondPage extends StatefulWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("second page"),
      ),
      body: Center(child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Text("second page "))),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    print("--print ------  ");

    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print("--  -- $state-------second page----.................");

    if (state == AppLifecycleState.resumed) {
      print("--  --resumed-------second page----.................");
    } else if (state == AppLifecycleState.inactive) {
      print("--  --inactive-------second page----.................");
    } else if (state == AppLifecycleState.paused) {
      print("--  --paused---------second page--.................");
    } else if (state == AppLifecycleState.detached) {
      print("--  --detached-------second page----.................");
    }
  }


  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}
