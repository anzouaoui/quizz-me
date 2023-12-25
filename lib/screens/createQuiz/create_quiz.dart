import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CreateQuizScreen extends StatefulWidget {
  const CreateQuizScreen({super.key});

  @override
  State<CreateQuizScreen> createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  final durationList = [
    "05 Minutes",
    "10 Minutes",
    "15 Minutes",
    "20 Minutes",
    "25 Minutes",
    "30 Minutes",
    "35 Minutes",
    "40 Minutes",
    "45 Minutes",
    "50 Minutes",
    "55 Minutes",
    "60 Minutes",
  ];

  String? selectedDuration;

  @override
  void initState() {
    setState(() {
      selectedDuration = durationList[2];
    });
    super.initState();
  }

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
          "Create Quiz",
          style: extrabold22White,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: [
          quizIdPasswordFields(),
          heightSpace,
          heightSpace,
          quizNameField(),
          heightSpace,
          heightSpace,
          questiontypeField(),
          heightSpace,
          heightSpace,
          numberOfQuestionField(),
          heightSpace,
          heightSpace,
          quizDuration(),
        ],
      ),
      bottomNavigationBar: continueButton(),
    );
  }

  continueButton() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/createQuizDetail');
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

  quizDuration() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quiz Duration",
          style: semibold16Grey,
        ),
        heightSpace,
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 1.2, vertical: fixPadding / 2),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: DropdownButton(
              value: selectedDuration,
              isExpanded: true,
              underline: const SizedBox(),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 26,
              ),
              items: List.generate(durationList.length, (index) {
                return DropdownMenuItem(
                  value: durationList[index],
                  child: Text(
                    durationList[index],
                    style: semibold18Black,
                  ),
                );
              }),
              onChanged: (value) {
                setState(() {
                  selectedDuration = value.toString();
                });
              }),
        ),
      ],
    );
  }

  numberOfQuestionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Number of Question",
          style: semibold16Grey,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.number,
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
              hintText: "Enter number of question",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  questiontypeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Question Type",
          style: semibold16Grey,
        ),
        heightSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: TextField(
            style: semibold18Black,
            cursorColor: primaryColor,
            keyboardType: TextInputType.text,
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
              hintText: "Enter question type",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  quizNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quiz Name",
          style: semibold16Grey,
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
              hintText: "Enter quiz name",
              hintStyle: semibold16Grey,
            ),
          ),
        ),
      ],
    );
  }

  quizIdPasswordFields() {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  "Quiz ID:",
                  style: semibold18Black,
                ),
              ),
              widthSpace,
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: semibold18Black,
                  cursorColor: primaryColor,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: "Enter quiz id",
                    hintStyle: semibold16Grey,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: const [
              Expanded(
                child: Text(
                  "Quiz Password:",
                  style: semibold18Black,
                ),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: semibold18Black,
                  cursorColor: primaryColor,
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: "Enter quiz password",
                    hintStyle: semibold16Grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
