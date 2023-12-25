import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/screens/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onwillpop();
        if (backStatus) {
          exit(0);
        } else {
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: ListView(
          padding: const EdgeInsets.all(fixPadding),
          physics: const BouncingScrollPhysics(),
          children: [
            heigthBox(fixPadding * 3.0),
            closeButton(context),
            heigthBox(fixPadding),
            Stack(
              clipBehavior: Clip.none,
              children: [
                scoreDetail(size),
                doneImage(size),
              ],
            )
          ],
        ),
      ),
    );
  }

  scoreDetail(Size size) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: fixPadding,
        right: fixPadding,
        top: size.height * 0.17,
      ),
      padding: const EdgeInsets.all(fixPadding * 3.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          heigthBox(20.0),
          goodJobText(),
          heightSpace,
          const Text(
            "Your Score",
            style: bold16Black,
          ),
          const Text(
            "130",
            style: bebas40Black,
          ),
          heightSpace,
          Row(
            children: [
              scoreWidget("15", "Question", greyColor),
              widthSpace,
              widthSpace,
              scoreWidget("13", "Correct", greenColor),
              widthSpace,
              widthSpace,
              scoreWidget("02", "Incorrect", redColor),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          leaderboardButton()
        ],
      ),
    );
  }

  closeButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/bottombar');
          },
          icon: const Icon(
            Icons.close,
            color: whiteColor,
          ),
        ),
      ],
    );
  }

  leaderboardButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomBarScreen(selectedId: 2)));
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.25),
              blurRadius: 32,
              offset: const Offset(0, 16),
            )
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          "Leaderboard",
          style: bold20White,
        ),
      ),
    );
  }

  scoreWidget(String text1, String text2, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: fixPadding,
          horizontal: fixPadding / 2,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            Text(
              text1,
              style: extrabold22White,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              text2,
              style: semibold16White,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  doneImage(Size size) {
    return Positioned(
      left: 0,
      right: 0,
      child: Center(
        child: Image.asset(
          "assets/quizResult/done.png",
          height: size.height * 0.235,
          width: size.height * 0.27,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  goodJobText() {
    return Stack(
      children: [
        Text(
          "Good Job",
          style: black32Primary.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.2
              ..color = primaryColor,
          ),
        ),
        const Positioned(
          left: 2,
          child: Text(
            "Good Job",
            style: black32Primary,
          ),
        ),
      ],
    );
  }

  onwillpop() {
    Navigator.pushNamed(context, '/bottombar');
  }
}
