import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/onboarding.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  DateTime? backPressTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final pageModelList = [
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/onboarding/new_onboarding1.png",
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                const Text(
                  "Test tes connaissances",
                  style: extrabold26Black,
                  textAlign: TextAlign.center,
                ),
                heightSpace,
                const Text(
                  "Partage avec tes amis",
                  style: semibold16Grey,
                  textAlign: TextAlign.center,
                ),
                heightSpace,
                heightSpace,
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/onboarding/new_onboarding2.png",
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                const Text(
                  "Test tes amis",
                  style: extrabold26Black,
                  textAlign: TextAlign.center,
                ),
                heightSpace,
                const Text(
                  "Viens tester tes amis et tes connaissances",
                  style: semibold16Grey,
                  textAlign: TextAlign.center,
                ),
                heightSpace,
                heightSpace,
              ],
            ),
          ),
        ),
      ),
      PageModel(
        widget: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/onboarding/new_onboarding3.png",
                  fit: BoxFit.cover,
                  height: size.height * 0.3,
                ),
                const Spacer(),
                const Text(
                  "Regarde le classement",
                  style: extrabold26Black,
                  textAlign: TextAlign.center,
                ),
                heightSpace,
                const Text(
                  "Classe toi parmis les meilleurs !!",
                  style: semibold16Grey,
                  textAlign: TextAlign.center,
                ),
                heightSpace,
                heightSpace,
              ],
            ),
          ),
        ),
      )
    ];

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
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: Onboarding(
                  pages: pageModelList,
                  startPageIndex: currentIndex,
                  onPageChange: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  footerBuilder:
                      (context, netDragDistance, pagesLength, setIndex) {
                    return Column(
                      children: [
                        heightSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pagesLength,
                            (index) => _buildDot(index),
                          ),
                        ),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        (pagesLength == currentIndex + 1)
                            ? getStartedButton(context)
                            : nextButton(context),
                        pagesLength == currentIndex + 1
                            ? const TextButton(
                                onPressed: null,
                                child: Text(
                                  "",
                                  style: bold16Primary,
                                ),
                              )
                            : skipButton(context),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  skipButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: const Text(
        "Passer",
        style: bold16Primary,
      ),
    );
  }

  getStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/login');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 4.0),
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
          "Commencer",
          style: bold20White,
        ),
      ),
    );
  }

  nextButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex++;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 4.0),
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
          "Suite",
          style: bold20White,
        ),
      ),
    );
  }

  _buildDot(index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: fixPadding / 1.2),
      height: currentIndex == index ? 10 : 6,
      width: currentIndex == index ? 10 : 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            currentIndex == index ? primaryColor : greyColor.withOpacity(0.5),
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
            "Retour",
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
