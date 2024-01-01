import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class MusicCategoriesScreen extends StatefulWidget {
  const MusicCategoriesScreen({super.key});

  @override
  State<MusicCategoriesScreen> createState() => _MusicCategoriesScreenState();
}

class _MusicCategoriesScreenState extends State<MusicCategoriesScreen> {
  final musicCategoriesList = [
    {
      "image": "assets/home/classical_music.png",
      "title": "Musique Classique",
      "quiz": "8",
      "color": blackColor
    },
    {
      "image": "assets/home/dessins_animes.png",
      "title": "Dessins animés",
      "quiz": "12",
      "color": orangeColor
    },
    {
      "image": "assets/home/disney.png",
      "title": "Disney",
      "quiz": "09",
      "color": lightBlueColor
    },
    {
      "image": "assets/home/ghibli.png",
      "title": "Ghibli",
      "quiz": "10",
      "color": blackColor
    },
    {
      "image": "assets/home/variete_francaise.png",
      "title": "Variété française",
      "quiz": "09",
      "color": orangeColor
    },
    {
      "image": "assets/home/korean.png",
      "title": "kpop",
      "quiz": "12",
      "color": pinkColor
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
          "Choisi ton quiz musical",
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
                  height: 70,
                  width: 80,
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
                        "${musicCategoriesList[index]['quiz']} Quiz",
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
