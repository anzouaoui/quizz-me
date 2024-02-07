///****************************************************************
///******************** PAGE LEVELS *******************************
///****************************************************************

import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelEight/NiveauHuitPage_screen.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelFive/NiveauCinqPage_screen.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelFour/NiveauQuatrePage_screen.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelSeven/NiveauSeptPage_screen.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelSix/NiveauSixPage_screen.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelThree/NiveauTroisPage_screen.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelTwo/NiveauDeuxPage_screen.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/Levels/LevelOne/NiveauUnPage_screen.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class LevelsPage extends StatelessWidget {
  LevelsPage({Key? key}) : super(key: key);


  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              width: double.maxFinite,
              color: primaryColor,
              padding: const EdgeInsets.symmetric(
                  vertical: fixPadding * 3, horizontal: fixPadding * 2.0),
              child: const SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    heightSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "Quiz musical - Musiques classiques",
                            style: extrabold22White,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),

              //BOUTON NIVEAU 1
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                    int i = 0;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NiveauUnPage()));
                  },
                  child: const Text(
                    "NIVEAU 1",
                    style: bebas36White,
                  ),
                ),
              ),

              //BOUTON NIVEAU 2
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NiveauDeuxPage()));

                  },
                  child: const Text(
                    "NIVEAU 2",
                    style: bebas36White
                  ),
                ),
              ),

              //BOUTON NIVEAU 3
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NiveauTroisPage()));
                  },
                  child: const Text(
                    "NIVEAU 3",
                    style: bebas36White
                  ),
                ),
              ),

              //BOUTON NIVEAU 4
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NiveauQuatrePage()));
                  },
                  child: const Text(
                    "NIVEAU 4",
                    style: bebas36White
                  ),
                ),
              ),
              //BOUTON NIVEAU 5
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NiveauCinqPage()));
                  },
                  child: const Text(
                    "NIVEAU 5",
                    style: bebas36White
                  ),
                ),
              ),



              //BOUTON NIVEAU 6
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NiveauSixPage()));
                  },
                  child: const Text(
                    "NIVEAU 6",
                    style: bebas36White
                  ),
                ),
              ),
              //BOUTON NIVEAU 7
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NiveauSeptPage()));
                  },
                  child: const Text(
                    "NIVEAU 7",
                    style: bebas36White
                  ),
                ),
              ),
              //BOUTON NIVEAU 8
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 32.0, vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                      minimumSize: const Size(30.0, 50.0)
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NiveauHuitPage()));
                  },
                  child: const Text(
                    "NIVEAU 8",
                    style: bebas36White
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                child: const Text(
                  "Quitter",
                  style: bold20Primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  exitbutton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, "/home");
      },
      child: const Text(
        "Quitter",
        style: bold20Primary,
      ),
    );
  }

  header() {
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
                    "Quiz musical}",
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
                    ],
                  ),
                )
              ],
            ),
            heightSpace,
            heightSpace,
          ],
        ),
      ),
    );
  }
}