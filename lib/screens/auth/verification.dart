import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../theme/theme.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: semibold18Black,
    margin: const EdgeInsets.symmetric(horizontal: fixPadding),
    decoration: BoxDecoration(
      color: primaryColor.withOpacity(0.05),
      border: const Border(),
      borderRadius: BorderRadius.circular(5.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          header(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              physics: const BouncingScrollPhysics(),
              children: [
                heightSpace,
                heightSpace,
                otpField(),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                continueButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  continueButton() {
    return GestureDetector(
      onTap: () {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, '/bottombar');
        });
        pleasewaitDialog();
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
          "Continue",
          style: bold20White,
        ),
      ),
    );
  }

  pleasewaitDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(
              vertical: fixPadding * 2.5, horizontal: fixPadding * 2.0),
          insetPadding: const EdgeInsets.all(fixPadding * 2.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(
                  color: primaryColor,
                  strokeWidth: 4,
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Please wait...",
                style: semibold16Grey,
              )
            ],
          ),
        );
      },
    );
  }

  otpField() {
    return Form(
      key: formKey,
      child: Pinput(
        controller: pinController,
        focusNode: focusNode,
        onCompleted: (value) {
          Timer(const Duration(seconds: 3), () {
            Navigator.pushNamed(context, '/bottombar');
          });
          pleasewaitDialog();
        },
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: primaryColor.withOpacity(0.05),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
          ),
        ),
        cursor: Container(
          height: 20,
          width: 2,
          color: primaryColor,
        ),
      ),
    );
  }

  header(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(
        vertical: fixPadding * 3.5,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: fixPadding * 2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 1.5, top: fixPadding / 2),
                  child: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                    size: 26,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Verification code",
                      style: extrabold26White,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "We have sent the verification code to +(444) 148-7896",
                      style: semibold16White,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
