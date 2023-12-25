import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';
import '../screens.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key, this.selectedId});

  final int? selectedId;

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int? seletcedIndex;

  DateTime? backPressTime;

  final pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const LeaderBaordScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    setState(() {
      seletcedIndex = widget.selectedId ?? 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillpop(context);
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: pages.elementAt(seletcedIndex!),
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, '/createQuiz');
            },
            child: const Icon(
              FontAwesomeIcons.plus,
              size: 22,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
              iconSize: 22,
              notchSmoothness: NotchSmoothness.sharpEdge,
              splashColor: Colors.transparent,
              splashRadius: 0,
              borderWidth: 6,
              borderColor: primaryColor,
              backgroundColor: primaryColor,
              activeColor: whiteColor,
              inactiveColor: whiteColor.withOpacity(0.5),
              gapLocation: GapLocation.center,
              icons: const [
                FontAwesomeIcons.house,
                FontAwesomeIcons.clockRotateLeft,
                FontAwesomeIcons.trophy,
                FontAwesomeIcons.solidUser
              ],
              activeIndex: seletcedIndex!,
              onTap: (index) {
                setState(() {
                  seletcedIndex = index;
                });
              }),
        ),
      ),
    );
  }

  onWillpop(context) {
    DateTime now = DateTime.now();
    if (backPressTime == null ||
        now.difference(backPressTime!) >= const Duration(seconds: 2)) {
      backPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: blackColor,
          content: Text(
            "Press back once again to exit",
            style: bold15White,
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(milliseconds: 1500),
        ),
      );
      return false;
    } else {
      return true;
    }
  }
}
