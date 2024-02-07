import 'package:flutter/material.dart';

import 'package:rc_fl_quiz_app/theme/theme.dart';

class MusicCategoriesScreen extends StatefulWidget {
  const MusicCategoriesScreen({super.key});

  @override
  State<MusicCategoriesScreen> createState() => _MusicCategoriesScreenState();
}

class _MusicCategoriesScreenState extends State<MusicCategoriesScreen> {
  final musicCategoriesList = [
    {
      "image": "assets/musicCategories/classical.png",
      "title": "Musique classique",
      "quiz": "8",
      "color": pinkColor,
      "link": '/MusicQuiz'
    },
    {
      "image": "assets/musicCategories/cartoon.png",
      "title": "Dessin animé",
      "quiz": "8",
      "color": orangeColor,
      "link": '/home'
    },
    {
      "image": "assets/musicCategories/kpop.png",
      "title": "K-POP",
      "quiz": "8",
      "color": orangeColor,
      "link": '/home'
    },
    {
      "image": "assets/musicCategories/pop.png",
      "title": "Pop",
      "quiz": "8",
      "color": lightBlueColor,
      "link": '/home'
    },
    {
      "image": "assets/musicCategories/variety.png",
      "title": "Variété française",
      "quiz": "8",
      "color": lightGreenColor,
      "link": '/home'
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
          "MUSIQUE",
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
      itemCount: musicCategoriesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, musicCategoriesList[index]['link'].toString(),
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
                    musicCategoriesList[index]['image'].toString(),
                    color: musicCategoriesList[index]['color'] as Color,
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
                        musicCategoriesList[index]['title'].toString(),
                        style: bold18Black,
                      ),
                      height5Space,
                      Text(
                        "${musicCategoriesList[index]['quiz']} niveaux",
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
