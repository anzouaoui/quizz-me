import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';

import '../../theme/theme.dart';

class RandomUserScreen extends StatefulWidget {
  const RandomUserScreen({super.key});

  @override
  State<RandomUserScreen> createState() => _RandomUserScreenState();
}

class _RandomUserScreenState extends State<RandomUserScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.14,
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
            size: 26,
          ),
        ),
        title: const Text(
          "Start Quiz",
          style: extrabold22White,
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          searchVSImage(size),
          user1(size),
          user2(size),
        ],
      ),
      bottomNavigationBar: continueButton(),
    );
  }

  searchVSImage(Size size) {
    return Container(
      height: size.height * 0.48,
      margin: const EdgeInsets.only(top: fixPadding * 4.0),
      child: ColorSonar(
        contentAreaRadius: 70.0,
        waveFall: 48.0,
        innerWaveColor: primaryColor.withOpacity(0.17),
        middleWaveColor: primaryColor.withOpacity(0.13),
        outerWaveColor: primaryColor.withOpacity(0.09),
        waveMotion: WaveMotion.synced,
        duration: const Duration(seconds: 2),
        waveMotionEffect: Curves.easeInOut,
        child: CircleAvatar(
          radius: 70.0,
          backgroundColor: primaryColor.withOpacity(0.35),
          child: Image.asset(
            "assets/randomUser/VS.png",
            height: size.height * 0.15,
          ),
        ),
      ),
    );
  }

  user1(Size size) {
    return Positioned(
      top: 40,
      left: 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "You",
            style: extrabold20lightBlue,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.all(fixPadding * 1.5),
            height: size.height * 0.14,
            width: size.height * 0.14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: lightBlueColor, width: 4),
            ),
            child: Image.asset("assets/randomUser/user1.png"),
          )
        ],
      ),
    );
  }

  user2(Size size) {
    return Positioned(
      bottom: 20,
      right: 30,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Michael",
            style: extrabold20lightGreen,
          ),
          heightSpace,
          Container(
            padding: const EdgeInsets.all(fixPadding * 1.5),
            height: size.height * 0.14,
            width: size.height * 0.14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: lightGreenColor, width: 4),
            ),
            child: Image.asset("assets/randomUser/user2.png"),
          )
        ],
      ),
    );
  }

  continueButton() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/liveQuiz',
              arguments: {"name": "group"});
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: fixPadding * 4.0, vertical: fixPadding * 2.0),
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
          child: const Text(
            "Continue",
            style: bold20White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
