import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class LiveQuizFoundScreen extends StatefulWidget {
  const LiveQuizFoundScreen({super.key});

  @override
  State<LiveQuizFoundScreen> createState() => _LiveQuizFoundScreenState();
}

class _LiveQuizFoundScreenState extends State<LiveQuizFoundScreen> {
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

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
          quizfoundTitle(),
          height5Space,
          quizTypeText(),
          heightSpace,
          heightSpace,
          createdByInfo(),
          heightSpace,
          heightSpace,
          aboutTitle(),
          heightSpace,
          aboutQuizDetails()
        ],
      ),
      bottomNavigationBar: startQuizButton(name),
    );
  }

  aboutQuizDetails() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(fixPadding * 1.5),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          aboutQuizWidget("Quiz Type:", "MCQ"),
          heightSpace,
          heightSpace,
          aboutQuizWidget("Number of Question:", "15"),
          heightSpace,
          heightSpace,
          aboutQuizWidget("Quiz Duration:", "15 Minutes"),
        ],
      ),
    );
  }

  quizTypeText() {
    return const Text(
      "Biology and Science Quiz 2022",
      style: semibold16Grey,
      textAlign: TextAlign.center,
    );
  }

  quizfoundTitle() {
    return const Text(
      "Quiz Found!",
      style: extrabold20Primary,
      textAlign: TextAlign.center,
    );
  }

  aboutQuizWidget(String title, String detail) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: semibold18Black,
          ),
        ),
        Text(
          detail,
          style: semibold16Grey,
        )
      ],
    );
  }

  aboutTitle() {
    return const Text(
      "About This Quiz",
      style: semibold16Grey,
    );
  }

  createdByInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Created By",
          style: semibold16Grey,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.all(fixPadding / 1.5),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: primaryColor.withOpacity(0.05),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/joinQuiz/memojiGirls.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              widthSpace,
              const Expanded(
                child: Text(
                  "Marti Lufkin",
                  style: semibold18Black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  startQuizButton(name) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          name == "group"
              ? Navigator.pushNamed(context, '/groupQuiz')
              : Navigator.pushNamed(context, '/quiz');
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
            "Start Quiz",
            style: bold20White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
