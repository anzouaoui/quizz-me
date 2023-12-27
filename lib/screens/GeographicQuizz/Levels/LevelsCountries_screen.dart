///****************************************************************
///******************** PAGE LEVELS *******************************
///****************************************************************

import 'package:rc_fl_quiz_app/screens/GeographicQuizz/Levels/LevelOne/NiveauUnPaysPage_screen.dart';
import 'package:rc_fl_quiz_app/screens/GeographicQuizz/Levels/LevelTwo/NiveaDeuxPaysPage_screen.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class LevelsCountriesPage extends StatelessWidget {
  LevelsCountriesPage({Key? key}) : super(key: key);


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
                            "Drapeaux du monde",
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
                            builder: (context) => const NiveauUnPaysPage()));
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
                    int i = 0;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NiveauDeuxPaysPage()));
                  },
                  child: const Text(
                    "NIVEAU 2",
                    style: bebas36White,
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
                    "Drapeaux du monde",
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