import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CreateQuizDoneScreen extends StatefulWidget {
  const CreateQuizDoneScreen({super.key});

  @override
  State<CreateQuizDoneScreen> createState() => _CreateQuizDoneScreenState();
}

class _CreateQuizDoneScreenState extends State<CreateQuizDoneScreen> {
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
        top: size.height * 0.175,
      ),
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 3.0, horizontal: fixPadding * 2.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          heigthBox(20.0),
          heightSpace,
          const Text(
            "Quiz Name",
            style: semibold16Grey,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "Biology and Science 2022",
            style: bold20Black,
            overflow: TextOverflow.ellipsis,
          ),
          heightSpace,
          heightSpace,
          quizInfoWidget("Quiz ID:", "444 485 8965"),
          heightSpace,
          quizInfoWidget("Quiz Password:", "abc@123"),
          heightSpace,
          quizInfoWidget("Invite Link", "quizx.com/kul-khgy-gqz"),
          heightSpace,
          heightSpace,
          heightSpace,
          shareLinkButton()
        ],
      ),
    );
  }

  quizInfoWidget(String title, String detail) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: semibold16Black,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            detail,
            style: semibold18Primary,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
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

  shareLinkButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bottombar');
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
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          "Share Link",
          style: bold20White,
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

  onwillpop() {
    Navigator.pushNamed(context, '/bottombar');
  }
}
