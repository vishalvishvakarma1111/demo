import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/bloc_demo/indo_shyam/indo_shyam.dart';
import 'package:untitled/slivers_demo/demo.dart';
import 'package:untitled/slivers_demo/sticky_list_view.dart';
import 'package:untitled/whatsapp_profile_scroll/whatsapp_profile_appbar.dart';

import 'bloc_demo/login_view.dart';
import 'bottom_navigation.dart';

void main() async {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(),
     //home: const SliverDemo(),
      // home: const StickyMultipleListView(),
      // home: const BlocSplashView(),
      // home: StateProDemo(),
      //home: BlocLoginView(),
      // home: CustomerRegistrationView(),
      home: WhatsAppProfileView(),
     // home: BottomNaviView(),
    );
  }
}
