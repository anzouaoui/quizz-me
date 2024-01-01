import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordObscure = true;

  bool rememberMe = true;

  DateTime? backPressTime;

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
          body: Column(
            children: [
              header(),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  children: [
                    emailField(),
                    heightSpace,
                    heightSpace,
                    passwordField(),
                    heightSpace,
                    Row(
                      children: [
                        rememberMeCheckBox(),
                        forgotPasswordText(),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    loginButton(),
                  ],
                ),
              ),
              registerNowText(context)
            ],
          ),
        ),
      ),
    );
  }

  header() {
    return Container(
      width: double.maxFinite,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 3.5, horizontal: fixPadding),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Bienvenu sur Quizz-me",
              style: extrabold26White,
            ),
            Text(
              "Connexion pour continuer",
              style: semibold16White,
            )
          ],
        ),
      ),
    );
  }

  registerNowText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: "Pas encore de compte ?",
          style: semibold16Grey,
          children: [
            const TextSpan(text: " "),
            TextSpan(
              text: "S'inscrire",
              style: bold16Primary,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/register');
                },
            )
          ],
        ),
      ),
    );
  }

  loginButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/register');
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
          "Connexion",
          style: bold20White,
        ),
      ),
    );
  }

  forgotPasswordText() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/forgotPassword');
      },
      child: Text(
        "Mot de passe oublié ?",
        style: semibold16Primary.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  rememberMeCheckBox() {
    return Expanded(
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                rememberMe = !rememberMe;
              });
            },
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: rememberMe ? primaryColor : whiteColor,
                borderRadius: BorderRadius.circular(2.0),
                border: rememberMe
                    ? null
                    : Border.all(color: primaryColor, width: 2),
              ),
              child: rememberMe
                  ? const Icon(
                      Icons.done_rounded,
                      color: whiteColor,
                      size: 16,
                    )
                  : const SizedBox(),
            ),
          ),
          widthSpace,
          const Expanded(
            child: Text(
              "Se souvenir de moi",
              style: semibold16Grey,
            ),
          )
        ],
      ),
    );
  }

  passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Mot de passe ",
            style: semibold18Black,
            children: [
              TextSpan(text: " "),
              TextSpan(text: "*", style: semibold16Red)
            ],
          ),
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isPasswordObscure,
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
              hintText: "Ton mot de passe",
              hintStyle: semibold16Grey,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordObscure = !isPasswordObscure;
                  });
                },
                icon: Icon(
                  isPasswordObscure ? Icons.visibility : Icons.visibility_off,
                  color: greyColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Adresse email",
            style: semibold18Black,
            children: [
              TextSpan(text: " "),
              TextSpan(text: "*", style: semibold16Red)
            ],
          ),
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
              hintText: "Ton adresse email",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
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
