import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../screens.dart';

class GroupQuizResultScreen extends StatefulWidget {
  const GroupQuizResultScreen({super.key});

  @override
  State<GroupQuizResultScreen> createState() => _GroupQuizResultScreenState();
}

class _GroupQuizResultScreenState extends State<GroupQuizResultScreen> {
  final vsImageList = [
    "assets/groupQuizResult/VS1.png",
    "assets/groupQuizResult/VS2.png",
    "assets/groupQuizResult/VS3.png"
  ];

  int _pos = 0;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() {
        _pos = (_pos + 1) % vsImageList.length;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _timer = null;
    super.dispose();
  }

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
      padding: const EdgeInsets.all(fixPadding * 2.0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              scoreWidget(
                  primaryColor,
                  lightBlueColor,
                  "90",
                  "assets/groupQuizResult/Vector1.png",
                  "You",
                  "assets/randomUser/user1.png",
                  true),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: fixPadding * 1.5,
                      left: fixPadding / 2,
                      right: fixPadding / 2),
                  child: Image.asset(
                    vsImageList[_pos],
                    gaplessPlayback: true,
                    fit: BoxFit.contain,
                    height: 90,
                  ),
                ),
              ),
              scoreWidget(
                  primaryColor,
                  lightGreenColor,
                  "80",
                  "assets/groupQuizResult/Vector2.png",
                  "Michael",
                  "assets/randomUser/user2.png",
                  false),
            ],
          ),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  scoreWidget(Color color1, Color color2, String score, String image,
      String name, String userImage, bool isWinner) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: color1, width: 4),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 70,
                child: Container(
                  height: 90,
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    score,
                    style: bebas36White,
                  ),
                ),
              ),
              Positioned(
                top: 3.5,
                left: 0,
                right: 0,
                child: Container(
                  height: 83,
                  width: 83,
                  padding: const EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      )
                    ],
                    border: Border.all(
                      color: color2,
                      width: 4,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        userImage,
                        fit: BoxFit.cover,
                      ),
                      isWinner == true
                          ? Positioned(
                              left: 0,
                              right: 0,
                              top: -30,
                              child: Image.asset(
                                "assets/groupQuizResult/crown.png",
                                fit: BoxFit.cover,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        heightSpace,
        Text(
          name,
          style: extrabold20lightBlue.copyWith(color: color2),
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
