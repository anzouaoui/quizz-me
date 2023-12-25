import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final historyList = [
    {
      "image": "assets/home/biology.png",
      "title": "Biology and Science Quiz",
      "detail": "You and your friend participate in this quiz",
      "color": orangeColor
    },
    {
      "image": "assets/home/maths.png",
      "title": "Math Quiz",
      "detail": "Your score 15 out of 20",
      "color": pinkColor
    },
    {
      "image": "assets/home/technology.png",
      "title": "Radio Technology Part - ||",
      "detail": "Your score 20 out of 20",
      "color": lightGreenColor
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.14,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Quiz History",
          style: extrabold22White,
        ),
      ),
      body: historyListContent(),
    );
  }

  historyListContent() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      physics: const BouncingScrollPhysics(),
      itemCount: historyList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 1.2, vertical: fixPadding * 2.0),
          margin: const EdgeInsets.symmetric(vertical: fixPadding),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: primaryColor.withOpacity(0.05),
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: historyList[index]['color'] as Color,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  historyList[index]['image'].toString(),
                  fit: BoxFit.cover,
                  color: whiteColor,
                ),
              ),
              widthSpace,
              width5Space,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      historyList[index]['title'].toString(),
                      style: bold18Black,
                    ),
                    Text(
                      historyList[index]['detail'].toString(),
                      style: semibold16Grey,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
