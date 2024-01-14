import 'package:flutter/material.dart';

import 'package:rc_fl_quiz_app/theme/theme.dart';

class GeographicCategoriesScreen extends StatefulWidget {
  const GeographicCategoriesScreen({super.key});

  @override
  State<GeographicCategoriesScreen> createState() => _GeographicCategoriesScreenState();
}

class _GeographicCategoriesScreenState extends State<GeographicCategoriesScreen> {
  final geographicCategoriesList = [
    {
      "image": "assets/geographicCategories/flag.png",
      "title": "Drapeaux",
      "quiz": "4",
      "color": lightBlueColor,
      "link": '/GeographicQuiz'
    },
    {
      "image": "assets/geographicCategories/capital.png",
      "title": "Capitales",
      "quiz": "8",
      "color": orangeColor,
      "link": '/CapitalesQuiz'
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
          "Thème GEOGRAPHIE",
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
      itemCount: geographicCategoriesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, geographicCategoriesList[index]['link'].toString(),
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
                    geographicCategoriesList[index]['image'].toString(),
                    color: geographicCategoriesList[index]['color'] as Color,
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
                        geographicCategoriesList[index]['title'].toString(),
                        style: bold18Black,
                      ),
                      height5Space,
                      Text(
                        "${geographicCategoriesList[index]['quiz']} niveaux",
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
