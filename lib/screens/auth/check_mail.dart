
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class CheckMailScreen extends StatelessWidget {
  const CheckMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.all(fixPadding * 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      mailLogo(size),
                      heightSpace,
                      heightSpace,
                      checkMailText(),
                      sendLinkText(),
                      heightSpace,
                      heightSpace,
                      openEmailAppButton(context),
                      heightSpace,
                      height5Space,
                      skipText()
                    ],
                  ),
                  const Spacer(),
                  tryAnotherEmailText(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  mailLogo(Size size) {
    return Container(
      height: size.height * 0.12,
      width: size.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: primaryColor.withOpacity(0.1),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        "assets/auth/envelope-open-text.png",
        height: size.height * 0.06,
        width: size.height * 0.06,
      ),
    );
  }

  checkMailText() {
    return const Text(
      "Check your mail",
      style: extrabold26Black,
    );
  }

  sendLinkText() {
    return const Text(
      "We have sent a password recover link and instructions to your email.",
      style: semibold16Grey,
      textAlign: TextAlign.center,
    );
  }

  openEmailAppButton(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/createNewPassword');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
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
          "Open Email app",
          style: bold20White,
        ),
      ),
    );
  }

  skipText() {
    return const Text(
      "Skip, I’ll confirm later",
      style: bold16Grey,
    );
  }

  tryAnotherEmailText(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: "Did not receive the email? Check your spam filter, or",
        style: semibold16Grey,
        children: [
          const TextSpan(text: " "),
          TextSpan(
            text: "try another email address",
            style: bold16Primary,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
