import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isPasswordObscure = true;

  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
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
            "Create new password",
            style: extrabold22White,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(fixPadding * 2.0),
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              "Your new password must be different form previous used passwords.",
              style: semibold16Grey,
            ),
            heightSpace,
            heightSpace,
            passwordField(),
            heightSpace,
            heightSpace,
            confirmPasswordField(),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            resetPasswordButton(context),
          ],
        ),
      ),
    );
  }

  resetPasswordButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/login');
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
          "Reset Password",
          style: bold20White,
        ),
      ),
    );
  }

  confirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Confirm Password ",
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
            obscureText: isConfirmPasswordObscure,
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
              hintText: "Your password",
              hintStyle: semibold16Grey,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isConfirmPasswordObscure = !isConfirmPasswordObscure;
                  });
                },
                icon: Icon(
                  isConfirmPasswordObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: greyColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        height5Space,
        const Text(
          "Both password must match.",
          style: semibold16Primary,
        )
      ],
    );
  }

  passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Password",
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
              hintText: "Your password",
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
        height5Space,
        const Text(
          "Must be at least 8 characters",
          style: semibold16Primary,
        )
      ],
    );
  }
}
