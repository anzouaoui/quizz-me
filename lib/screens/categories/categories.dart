import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final categoriesList = [
    {
      "image": "assets/home/maths.png",
      "title": "Math and Statistics",
      "quiz": "10",
      "color": pinkColor
    },
    {
      "image": "assets/home/biology.png",
      "title": "Biology and Science",
      "quiz": "12",
      "color": orangeColor
    },
    {
      "image": "assets/home/music.png",
      "title": "Art and Music",
      "quiz": "09",
      "color": lightBlueColor
    },
    {
      "image": "assets/home/integers.png",
      "title": "Integers",
      "quiz": "10",
      "color": lightGreenColor
    },
    {
      "image": "assets/home/solarSystem.png",
      "title": "Solar System",
      "quiz": "09",
      "color": orangeColor
    },
    {
      "image": "assets/home/technology.png",
      "title": "Technology",
      "quiz": "12",
      "color": pinkColor
    },
    {
      "image": "assets/home/sport.png",
      "title": "Sports",
      "quiz": "09",
      "color": lightBlueColor
    },
    {
      "image": "assets/home/networking.png",
      "title": "Networking",
      "quiz": "09",
      "color": lightGreenColor
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
          "Choose Categories",
          style: extrabold22White,
        ),
      ),
      body: categoriesListContent(),
    );
  }

  categoriesListContent() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2.0, vertical: fixPadding),
      itemCount: categoriesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/liveQuiz',
                arguments: {"name": "quiz"});
          },
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: fixPadding),
            padding: const EdgeInsets.symmetric(
              vertical: fixPadding * 1.8,
              horizontal: fixPadding * 1.5,
            ),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  padding: const EdgeInsets.all(fixPadding * 1.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: whiteColor,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    categoriesList[index]['image'].toString(),
                    color: categoriesList[index]['color'] as Color,
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
                        categoriesList[index]['title'].toString(),
                        style: bold18Black,
                      ),
                      height5Space,
                      Text(
                        "${categoriesList[index]['quiz']} Quiz",
                        style: semibold16Grey,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
