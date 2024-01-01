import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CreateQuizDetailScreen extends StatefulWidget {
  const CreateQuizDetailScreen({super.key});

  @override
  State<CreateQuizDetailScreen> createState() => _CreateQuizDetailScreenState();
}

class _CreateQuizDetailScreenState extends State<CreateQuizDetailScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  TextEditingController option3Controller = TextEditingController();
  TextEditingController option4Controller = TextEditingController();

  int quizLength = 15;

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          header(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              physics: const BouncingScrollPhysics(),
              children: [
                questionField(),
                heightSpace,
                heightSpace,
                height5Space,
                const Text(
                  "Options",
                  style: extrabold20Black,
                ),
                heightSpace,
                heightSpace,
                option1Field(),
                heightSpace,
                heightSpace,
                option2Field(),
                heightSpace,
                heightSpace,
                option3Field(),
                heightSpace,
                heightSpace,
                option4Field(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: ((currentQuestionIndex + 1) == quizLength)
          ? finishButton()
          : continueButton(),
    );
  }

  finishButton() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/createQuizDone');
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
            "Finish",
            style: bold20White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  continueButton() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if ((currentQuestionIndex + 1) < quizLength) {
              currentQuestionIndex++;
            }
            questionController.clear();
            option1Controller.clear();
            option2Controller.clear();
            option3Controller.clear();
            option4Controller.clear();
          });
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
            "Continue",
            style: bold20White,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  option4Field() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: TextField(
        controller: option4Controller,
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
          hintText: "Enter Option 4",
          hintStyle: semibold16Grey,
        ),
      ),
    );
  }

  option3Field() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: TextField(
        controller: option3Controller,
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
          hintText: "Enter Option 3",
          hintStyle: semibold16Grey,
        ),
      ),
    );
  }

  option2Field() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: TextField(
        controller: option2Controller,
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
          hintText: "Enter Option 2",
          hintStyle: semibold16Grey,
        ),
      ),
    );
  }

  option1Field() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: TextField(
        controller: option1Controller,
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
          hintText: "Enter Option 1",
          hintStyle: semibold16Grey,
        ),
      ),
    );
  }

  questionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Question",
          style: extrabold20Black,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            controller: questionController,
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
              hintText: "Enter Question",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  header() {
    return Container(
      width: double.maxFinite,
      color: primaryColor,
      padding:
          const EdgeInsets.only(bottom: fixPadding * 3, top: fixPadding * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                ),
              ),
              const Expanded(
                child: Text(
                  "Create Quiz",
                  style: extrabold22White,
                ),
              ),
            ],
          ),
          heightSpace,
          height5Space,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              "Question ${currentQuestionIndex + 1}",
              style: extrabold22White,
            ),
          ),
          heightSpace,
          height5Space,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 1.8),
            child: Row(
              children: List.generate(
                quizLength,
                (index) {
                  return Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: currentQuestionIndex < index
                            ? whiteColor.withOpacity(0.3)
                            : whiteColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
