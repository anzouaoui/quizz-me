import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordObscure = true;

  bool rememberMe = true;

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
                namefield(),
                heightSpace,
                heightSpace,
                emailField(),
                heightSpace,
                heightSpace,
                passwordField(),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                registerButton(),
                heightSpace,
                heightSpace,
              ],
            ),
          ),
          loginNowText(context),
        ],
      ),
    );
  }

  registerButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/verification');
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
          "S'inscrire",
          style: bold20White,
        ),
      ),
    );
  }

  passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Mot de passe",
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
              hintText: "Mot de passe",
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
              hintText: "Adresse email",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  namefield() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: "Nom utilisateur",
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
            keyboardType: TextInputType.name,
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
              hintText: "Nom utilisateur",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  loginNowText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          text: "Déjà inscrit ? ",
          style: semibold16Grey,
          children: [
            const TextSpan(text: " "),
            TextSpan(
              text: "Se connecter",
              style: bold16Primary,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, '/login');
                },
            )
          ],
        ),
      ),
    );
  }

  header(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(vertical: fixPadding * 3.5),
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
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Bienvenu sur Quize-me !",
                      style: extrabold26White,
                    ),
                    Text(
                      "Créer ton compte pour continuer",
                      style: semibold16White,
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
