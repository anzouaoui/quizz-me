import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class LiveQuizScreen extends StatefulWidget {
  const LiveQuizScreen({super.key});

  @override
  State<LiveQuizScreen> createState() => _LiveQuizScreenState();
}

class _LiveQuizScreenState extends State<LiveQuizScreen> {
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    String name = data['name'].toString();
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
          "Join Quiz",
          style: extrabold22White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: [
          quizIdField(),
          heightSpace,
          heightSpace,
          quizPasswordField()
        ],
      ),
      bottomNavigationBar: nextButton(name),
    );
  }

  nextButton(name) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/liveQuizFound',
              arguments: {"name": name});
        },
        child: Container(
          margin: const EdgeInsets.only(
              left: fixPadding * 4.0,
              right: fixPadding * 4.0,
              bottom: fixPadding * 2.0,
              top: fixPadding),
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
            "Next",
            style: bold20White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  quizPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quiz Password",
          style: semibold18Black,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            style: semibold18Black,
            cursorColor: primaryColor,
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
              hintText: "Enter quiz password",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  quizIdField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quiz ID",
          style: semibold18Black,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            style: semibold18Black,
            cursorColor: primaryColor,
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
              hintText: "Enter quiz id",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }
}
