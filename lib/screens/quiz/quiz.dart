import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/widget/column_builder.dart';

import '../../theme/theme.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final quizList = [
    {
      "question":
          "A computer assisted method for the recording and analyzing of existing or hypothetical systems...",
      "options": [
        "Data transmission",
        "Data flow",
        "Data capture",
        "None of the above"
      ],
      "answer": "Data flow",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "Any type of storage that is used for holding information between steps in its processing is",
      "options": [
        "CPU",
        "Primary storage",
        "Intermediate storage",
        "Internal storage"
      ],
      "answer": "Intermediate storage",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A program component that allows structuring of a program in an unusual way is known as",
      "options": ["Correlation", "Coroutine", "Diagonalization", "Quene"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A computer assisted method for the recording and analyzing of existing or hypothetical systems...",
      "options": [
        "Data transmission",
        "Data flow",
        "Data capture",
        "None of the above",
      ],
      "answer": "Data flow",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "Any type of storage that is used for holding information between steps in its processing is",
      "options": [
        "CPU",
        "Primary storage",
        "Intermediate storage",
        "Internal storage"
      ],
      "answer": "Intermediate storage",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A program component that allows structuring of a program in an unusual way is known as",
      "options": ["Correlation", "Coroutine", "Diagonalization", "Quene"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A computer assisted method for the recording and analyzing of existing or hypothetical systems...",
      "options": [
        "Data transmission",
        "Data flow",
        "Data capture",
        "None of the above"
      ],
      "answer": "Data flow",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "Any type of storage that is used for holding information between steps in its processing is",
      "options": [
        "CPU",
        "Primary storage",
        "Intermediate storage",
        "Internal storage"
      ],
      "answer": "Intermediate storage",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A program component that allows structuring of a program in an unusual way is known as",
      "options": ["Correlation", "Coroutine", "Diagonalization", "Quene"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A computer assisted method for the recording and analyzing of existing or hypothetical systems...",
      "options": [
        "Data transmission",
        "Data flow",
        "Data capture",
        "None of the above"
      ],
      "answer": "Data flow",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "Any type of storage that is used for holding information between steps in its processing is",
      "options": [
        "CPU",
        "Primary storage",
        "Intermediate storage",
        "Internal storage"
      ],
      "answer": "Intermediate storage",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A program component that allows structuring of a program in an unusual way is known as",
      "options": ["Correlation", "Coroutine", "Diagonalization", "Quene"],
      "answer": "Coroutine",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A computer assisted method for the recording and analyzing of existing or hypothetical systems...",
      "options": [
        "Data transmission",
        "Data flow",
        "Data capture",
        "None of the above"
      ],
      "answer": "Data flow",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "Any type of storage that is used for holding information between steps in its processing is",
      "options": [
        "CPU",
        "Primary storage",
        "Intermediate storage",
        "Internal storage"
      ],
      "answer": "Intermediate storage",
      "userAnswer": "",
      "isAnsweCorrect": null
    },
    {
      "question":
          "A program component that allows structuring of a program in an unusual way is known as",
      "options": ["Correlation", "Coroutine", "Diagonalization", "Quene"],
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
    if (mounted) {
      setState(() {
        final seconds = myDuration.inSeconds + increaseSecondsBy;
        if (seconds < 0) {
          countdownTimer!.cancel();
        } else {
          myDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  int selectedQuestion = 0;

  String? userAnswer;

  bool? isCorrectAnswer;

  Border? borders;

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body: Column(
        children: [
          header(minutes, seconds),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(fixPadding * 2.0),
              physics: const BouncingScrollPhysics(),
              children: [
                Text(
                  "QUESTION ${selectedQuestion + 1} OF ${quizList.length}",
                  style: bold14Grey,
                ),
                heightSpace,
                Text(
                  quizList[selectedQuestion]['question'].toString(),
                  style: bold20Black,
                ),
                heightSpace,
                optionsList(),
                heightSpace,
                heightSpace,
                heightSpace,
                selectedQuestion == quizList.length - 1
                    ? finishButton()
                    : nextButton(),
                heightSpace,
                selectedQuestion == quizList.length - 1
                    ? const SizedBox()
                    : exitbutton(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  optionsList() {
    return ColumnBuilder(
        itemBuilder: (context, index) {
          final List<String> options =
              quizList[selectedQuestion]['options'] as List<String>;

          return GestureDetector(
            onTap: () {
              if (quizList[selectedQuestion]['userAnswer'] == '') {
                setState(() {
                  quizList[selectedQuestion]['userAnswer'] = options[index];
                });
                quizList[selectedQuestion]['isAnsweCorrect'] =
                    (quizList[selectedQuestion]['userAnswer'] ==
                        quizList[selectedQuestion]['answer']);
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
                border: border(index, options),
              ),
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
            (quizList[selectedQuestion]['options'] as List<String>).length);
  }

  exitbutton(BuildContext context) {
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
        Navigator.pushNamed(context, '/quizResult');
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
          if (selectedQuestion < quizList.length - 1) {
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

  header(String minutes, String seconds) {
    return Container(
      width: double.maxFinite,
      color: primaryColor,
      padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 3, horizontal: fixPadding * 2.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightSpace,
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
                quizList.length,
                (index) {
                  return Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: topHeaderBoxColor(index)),
                    ),
                  );
                },
              ),
            )
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
      if (quizList[index]['isAnsweCorrect'] == true) {
        return greenColor;
      } else {
        return redColor;
      }
    }
  }

  border(index, options) {
    if (quizList[selectedQuestion]['userAnswer'] == options[index]) {
      if (quizList[selectedQuestion]['isAnsweCorrect'] == true) {
        return Border.all(color: greenColor, width: 1.5);
      } else {
        return Border.all(color: redColor, width: 1.5);
      }
    }
    if (quizList[selectedQuestion]['userAnswer'] != '') {
      if (quizList[selectedQuestion]['answer'] == options[index]) {
        return Border.all(color: greenColor, width: 1.5);
      }
    }
  }

  icon(index, options) {
    if (quizList[selectedQuestion]['userAnswer'] != '') {
      if (quizList[selectedQuestion]['answer'] == options[index]) {
        return const Icon(
          Icons.check_circle_outline_rounded,
          color: greenColor,
        );
      }
    } else {
      return const SizedBox();
    }

    if (quizList[selectedQuestion]['userAnswer'] == options[index]) {
      if (quizList[selectedQuestion]['isAnsweCorrect'] == true) {
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
