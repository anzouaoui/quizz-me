import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final faqsList = [
    {
      "question": "How to carete account?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "How to play?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "How share refere code?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "Can i exit during the quiz?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "How to play with random users?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "How to play?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "How share refere code?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "Can i exit during the quiz?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
    {
      "question": "How to play with random users?",
      "Answer":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget vitae at est mauris, purus euismod tellus faucibus."
    },
  ];

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
          "FAQs",
          style: extrabold22White,
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0, vertical: fixPadding),
        itemCount: faqsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  expansionTileTheme: const ExpansionTileThemeData(
                    iconColor: greyColor,
                    collapsedIconColor: greyColor,
                    collapsedShape:
                        RoundedRectangleBorder(side: BorderSide.none),
                  ),
                ),
                child: ExpansionTile(
                  iconColor: primaryColor,
                  childrenPadding: const EdgeInsets.only(bottom: fixPadding),
                  tilePadding:
                      const EdgeInsets.symmetric(vertical: fixPadding / 2),
                  title: Row(
                    children: [
                      Text(
                        "${index + 1}. ",
                        style: semibold18Black,
                      ),
                      Expanded(
                        child: Text(
                          faqsList[index]['question'].toString(),
                          style: semibold18Black,
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Text(
                      faqsList[index]['Answer'].toString(),
                      style: semibold16Grey,
                    ),
                  ],
                ),
              ),
              faqsList.length == index + 1
                  ? const SizedBox()
                  : Container(
                      height: 1,
                      color: greyColor.withOpacity(0.3),
                      width: double.maxFinite,
                    )
            ],
          );
        },
      ),
    );
  }
}
