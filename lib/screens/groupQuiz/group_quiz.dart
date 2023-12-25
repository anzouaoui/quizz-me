import 'dart:async';

import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../../widget/column_builder.dart';

class GroupQuizScreen extends StatefulWidget {
  const GroupQuizScreen({super.key});

  @override
  State<GroupQuizScreen> createState() => _GroupQuizScreenState();
}

class _GroupQuizScreenState extends State<GroupQuizScreen> {
  final questionList = [
    {
      "question": "The brain of any computer system is",
      "options": ["ALU", "Memory", "CPU", "Control unit"],
      "answer": "CPU",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "Which method is used to connect a remote computer?",
      "options": ["Device", "Dialup", "Diagnostic", "Logic circuit"],
      "answer": "Dialup",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The symbols used in an assembly  language are",
      "options": ["Codes", "Mnemonics", "Assembler", "All of the above"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The brain of any computer system is",
      "options": ["ALU", "Memory", "CPU", "Control unit"],
      "answer": "CPU",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "Which method is used to connect a remote computer?",
      "options": ["Device", "Dialup", "Diagnostic", "Logic circuit"],
      "answer": "Dialup",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The symbols used in an assembly  language are",
      "options": ["Codes", "Mnemonics", "Assembler", "All of the above"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The brain of any computer system is",
      "options": ["ALU", "Memory", "CPU", "Control unit"],
      "answer": "CPU",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "Which method is used to connect a remote computer?",
      "options": ["Device", "Dialup", "Diagnostic", "Logic circuit"],
      "answer": "Dialup",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The symbols used in an assembly  language are",
      "options": ["Codes", "Mnemonics", "Assembler", "All of the above"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The brain of any computer system is",
      "options": ["ALU", "Memory", "CPU", "Control unit"],
      "answer": "CPU",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "Which method is used to connect a remote computer?",
      "options": ["Device", "Dialup", "Diagnostic", "Logic circuit"],
      "answer": "Dialup",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The symbols used in an assembly  language are",
      "options": ["Codes", "Mnemonics", "Assembler", "All of the above"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The brain of any computer system is",
      "options": ["ALU", "Memory", "CPU", "Control unit"],
      "answer": "CPU",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "Which method is used to connect a remote computer?",
      "options": ["Device", "Dialup", "Diagnostic", "Logic circuit"],
      "answer": "Dialup",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question": "The symbols used in an assembly  language are",
      "options": ["Codes", "Mnemonics", "Assembler", "All of the above"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
  ];

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 0);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 0));
  }

  void setCountDown() {
    const increaseSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds + increaseSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  int selectedQuestion = 0;

  String? userAnswer;

  bool? isCorrectAnswer;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: Column(
        children: [
          header(minutes, seconds, size),
          questions(context),
        ],
      ),
    );
  }

  questions(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(fixPadding * 2.0),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            "QUESTION ${selectedQuestion + 1} OF ${questionList.length}",
            style: bold14Grey,
          ),
          heightSpace,
          Text(
            questionList[selectedQuestion]['question'].toString(),
            style: bold20Black,
          ),
          heightSpace,
          optionsList(),
          heightSpace,
          heightSpace,
          heightSpace,
          selectedQuestion == questionList.length - 1
              ? finishButton()
              : nextButton(),
          heightSpace,
          selectedQuestion == questionList.length - 1
              ? const SizedBox()
              : extibutton(context)
        ],
      ),
    );
  }

  optionsList() {
    return ColumnBuilder(
        itemBuilder: (context, index) {
          final List<String> options =
              questionList[selectedQuestion]['options'] as List<String>;

          return GestureDetector(
            onTap: () {
              if (questionList[selectedQuestion]['userAnswer'] == '') {
                setState(() {
                  questionList[selectedQuestion]['userAnswer'] = options[index];
                });
                questionList[selectedQuestion]['isAnsweCorrect'] =
                    (questionList[selectedQuestion]['userAnswer'] ==
                        questionList[selectedQuestion]['answer']);
              }
            },
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(vertical: fixPadding),
              padding: const EdgeInsets.symmetric(
                  vertical: fixPadding * 1.5, horizontal: fixPadding * 1.2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: primaryColor.withOpacity(0.05),
                  border: border(index, options)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      options[index],
                      style: semibold16Grey,
                    ),
                  ),
                  icon(index, options),
                ],
              ),
            ),
          );
        },
        itemCount:
            (questionList[selectedQuestion]['options'] as List<String>).length);
  }

  extibutton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/bottombar");
      },
      child: const Text(
        "Exit",
        style: bold20Primary,
      ),
    );
  }

  finishButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/groupQuizResult');
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
          "Finish",
          style: bold20White,
        ),
      ),
    );
  }

  nextButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedQuestion < questionList.length - 1) {
            selectedQuestion++;
          }
        });
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
          "Next",
          style: bold20White,
        ),
      ),
    );
  }

  header(String minutes, String seconds, Size size) {
    return Container(
      width: double.maxFinite,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 2.5, horizontal: fixPadding * 2.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Question ${selectedQuestion + 1}",
                    style: extrabold22White,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: fixPadding / 2, horizontal: fixPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: whiteColor, width: 1.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.alarm,
                        color: whiteColor,
                        size: 22,
                      ),
                      width5Space,
                      Text(
                        "$minutes : $seconds",
                        textAlign: TextAlign.center,
                        style: semibold16White,
                      )
                    ],
                  ),
                )
              ],
            ),
            heightSpace,
            heightSpace,
            Row(
              children: List.generate(
                questionList.length,
                (index) {
                  return Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: topHeaderBoxColor(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            heightSpace,
            heightSpace,
            Container(
              padding: const EdgeInsets.all(fixPadding * 1.5),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          height: size.height * 0.085,
                          width: size.height * 0.085,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: lightBlueColor, width: 3),
                          ),
                          child: Image.asset("assets/randomUser/user1.png"),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "You",
                                style: bold18Black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "07",
                                style: bold16lightBlue,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                "Michael",
                                style: bold18Black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "02",
                                style: bold16lightGreen,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        widthSpace,
                        Container(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          height: size.height * 0.085,
                          width: size.height * 0.085,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: lightGreenColor, width: 3),
                          ),
                          child: Image.asset("assets/randomUser/user2.png"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  topHeaderBoxColor(index) {
    if (selectedQuestion < index) {
      return whiteColor.withOpacity(0.3);
    } else if (selectedQuestion == index) {
      return whiteColor;
    } else if (selectedQuestion > index) {
      if (questionList[index]['isAnsweCorrect'] == true) {
        return greenColor;
      } else {
        return redColor;
      }
    }
  }

  border(index, options) {
    if (questionList[selectedQuestion]['userAnswer'] == options[index]) {
      if (questionList[selectedQuestion]['isAnsweCorrect'] == true) {
        return Border.all(color: greenColor, width: 1.5);
      } else {
        return Border.all(color: redColor, width: 1.5);
      }
    }
    if (questionList[selectedQuestion]['userAnswer'] != '') {
      if (questionList[selectedQuestion]['answer'] == options[index]) {
        return Border.all(color: greenColor, width: 1.5);
      }
    }
  }

  icon(index, options) {
    if (questionList[selectedQuestion]['userAnswer'] != '') {
      if (questionList[selectedQuestion]['answer'] == options[index]) {
        return const Icon(
          Icons.check_circle_outline_rounded,
          color: greenColor,
        );
      }
    } else {
      return const SizedBox();
    }

    if (questionList[selectedQuestion]['userAnswer'] == options[index]) {
      if (questionList[selectedQuestion]['isAnsweCorrect'] == true) {
        return const Icon(
          Icons.check_circle_outline_rounded,
          color: greenColor,
        );
      } else {
        return const Icon(
          Icons.highlight_remove,
          color: redColor,
        );
      }
    } else {
      return const SizedBox();
    }
  }
}
