import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
          "Forget Password",
          style: extrabold22White,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          contentText(),
          heightSpace,
          heightSpace,
          heightSpace,
          emailField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          sendButton(context),
        ],
      ),
    );
  }

  sendButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/checkMailScreen');
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
          "Send",
          style: bold20White,
        ),
      ),
    );
  }

  contentText() {
    return const Text(
      "Enter the email associated with your account and we’ll send an email with recover link and instructionsto reset your password.",
      style: semibold16Grey,
    );
  }

  emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email Address ",
          style: semibold18Black,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor.withOpacity(0.05),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 1.2, vertical: fixPadding * 1.7),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: primaryColor, width: 1.5),
              ),
              hintText: "Your email address",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }
}
