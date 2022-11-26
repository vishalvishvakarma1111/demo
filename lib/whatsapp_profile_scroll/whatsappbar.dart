import 'dart:math';

import 'package:flutter/material.dart';

class WhatsAppBar extends SliverPersistentHeaderDelegate {
  static final appBarColorTween = ColorTween(begin: Colors.white, end: const Color.fromARGB(255, 4, 94, 84));
  static final appBarIconColoTween = ColorTween(begin: Colors.black, end: Colors.white);
  static final phoneNumberTranslateTween = Tween<double>(begin: 20.0, end: 0.0);
  static final phoneNumberFontTween = Tween<double>(begin: 20.0, end: 16.0);
  static final profileImageRadiusTween = Tween<double>(begin: 3.5, end: 1.0);
  static Tween<double> profilePicTranslateTween = Tween<double>(begin: 0.0, end: 0.0);
  double screenWidth=0.0;
  WhatsAppBar(this.screenWidth) {
    profilePicTranslateTween = Tween<double>(begin: screenWidth/2-45-40+15, end: 40.0);
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 70) / 70;

    return Container(
      color: appBarColorTween.transform(relativeScroll),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: appBarIconColoTween.transform(relativeScroll),
                )),
          ),
          Positioned(
            right: 0,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 25,
                  color: appBarIconColoTween.transform(relativeScroll),
                )),
          ),
          Positioned(
            top: 50,
            left: 100,
            child: displayPhoneNumber(relativeScroll70px),
          ),
          Positioned(
            top: 10,
            left: profilePicTranslateTween.transform(relativeScroll70px),
            child: displayProfilePicture(relativeScroll70px),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Widget displayPhoneNumber(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset >= 0.1) {
      return Transform(
        transform: Matrix4.identity()
          ..translate(
            0.0,
            phoneNumberTranslateTween.transform(
              ((relativeFullScrollOffset - 0.4) * 5),
            ),
          ),
        child: Text(
          "+91 96850714432",
          style: TextStyle(
              fontSize: (phoneNumberFontTween.transform(relativeFullScrollOffset - 0.2) * 1.5),
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(
          profileImageRadiusTween.transform(
            relativeFullScrollOffset,
          ),
        ),
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEgzwHNJhsADqquO7m7NFcXLbZdFZ2gM73x8I82vhyhg&s"),
      ),
    );
  }
}
