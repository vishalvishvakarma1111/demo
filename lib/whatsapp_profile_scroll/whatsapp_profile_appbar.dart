import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/whatsapp_profile_scroll/whatsappbar.dart';

class WhatsAppProfileView extends StatefulWidget {
  WhatsAppProfileView({Key? key}) : super(key: key);

  @override
  State<WhatsAppProfileView> createState() => _WhatsAppProfileViewState();
}

class _WhatsAppProfileViewState extends State<WhatsAppProfileView> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(milliseconds: 1500), vsync: this)..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    late final Animation<Offset> _offsetAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-3.5, 5.0)).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastLinearToSlowEaseIn,
    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: WhatsAppBar(MediaQuery.of(context).size.width),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite, color: Colors.red, size: 50),
                    ),
                  ),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      width: 50,
                      child: Icon(
                        Icons.favorite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
              Container(
                width: double.maxFinite,
                height: 150,
                color: Colors.blue,
                margin: const EdgeInsets.all(5),
              ),
            ]))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
