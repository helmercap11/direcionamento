import 'dart:io';
import 'package:direcionamento/screens/account/account.dart';
import 'package:direcionamento/screens/home_page/home_page.dart';
import 'package:direcionamento/screens/school_page/school_page.dart';
import 'package:direcionamento/screens/school_page/university_page.dart';
import 'package:direcionamento/screens/search_school/search_school.dart';
import 'package:direcionamento/screens/utils/constant.dart';
import 'package:direcionamento/theme/global_color.dart';
import 'package:direcionamento/widgets/custom_bottombar.dart';
import 'package:flutter/material.dart';


class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {

  int activeTab = 0;
  List barItems = [
    {
      "icon": "assets/icons/home.svg",
      "active_icon": "assets/icons/home.svg",
      "page": SchoolPage(),
    },
    {
      "icon": "assets/icons/search.svg",
      "active_icon": "assets/icons/search.svg",
      "page": SearchSchool(),

    },
    {
      "icon": "assets/icons/chat.svg",
      "active_icon": "assets/icons/chat.svg",
      "page": HomePage(),
    },
    {
      "icon": "assets/icons/location.svg",
      "active_icon": "assets/icons/location.svg",
      "page": HomePage(),
    },
    {
      "icon": "assets/icons/profile.svg",
      "active_icon": "assets/icons/profile.svg",
      "page": AccountPage(),
    },

  ];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: ANIMATED_BODY_MS),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(
        child: page,
        opacity: _animation);
  }


  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      bottomNavigationBar: getBotoomBar(),
      body: getBarPage(),
    );
  }


  Widget getBarPage() {
    return IndexedStack(
      index: activeTab,
      children:
      List.generate(barItems.length, (index) =>
          animatedPage(barItems[index]["page"])),
    );
  }

  Widget getBotoomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(1, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              barItems.length,
                  (index) =>
                  CustomBottomBarItem(
                    barItems[index]["icon"],
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      onPageChanged(index);
                    },
                  )),
        ),
      ),
    );
  }
}