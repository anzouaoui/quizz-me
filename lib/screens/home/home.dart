import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';
import 'package:rc_fl_quiz_app/widget/column_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double completePerent = 0.8;

  final livequizList = [
    {
      "image": "assets/home/music.png",
      "title": "Musique",
      "color": blackColor,
      "link": '/MusicQuiz',
    },
    {
      "image": "assets/home/world.png",
      "title": "Géographie",
      "color": lightGreenColor,
      "link": '/login'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          header(size),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(fixPadding * 2.0),
              physics: const BouncingScrollPhysics(),
              children: [
                liveQuizTitle(),
                liveQuizListContent(),
                heightSpace,
              ],
            ),
          )
        ],
      ),
    );
  }

  header(Size size) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height * 0.27,
          width: double.maxFinite,
          color: primaryColor,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heigthBox(fixPadding * 5.0),
            userInfo(size),
            heightSpace,
          ],
        )
      ],
    );
  }

  liveQuizListContent() {
    return ColumnBuilder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context,
                livequizList[index]['link'] as String
            );
          },
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(fixPadding * 1.5),
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(fixPadding),
                  decoration: BoxDecoration(
                    color: livequizList[index]['color'] as Color,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    livequizList[index]['image'].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                widthSpace,
                width5Space,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        livequizList[index]['title'].toString(),
                        style: bold18Black,
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: greyColor,
                  size: 26,
                )
              ],
            ),
          ),
        );
      },
      itemCount: livequizList.length,
    );
  }

  liveQuizTitle() {
    return const Row(
      children: [
        Expanded(
          child: Text(
            "Catégories",
            style: extrabold20Black,
          ),
        ),
      ],
    );
  }

  userInfo(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/home/new_logo.png",
                    height: size.height * 0.2,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
