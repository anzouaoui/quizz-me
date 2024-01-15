///****************************************************************
///********************** NIVEAU 2 ********************************
///****************************************************************

import 'package:rc_fl_quiz_app/screens/GeographicQuizz/Results/countries_quiz_result_level_one.dart';
import 'package:rc_fl_quiz_app/screens/capitalGeographicQuizz/Results/capital_quiz_result_level_two.dart';
import 'package:rc_fl_quiz_app/screens/capitalGeographicQuizz/data/niveau_deux_capitale_list.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';

class NiveauDeuxCapitalesPage extends StatefulWidget {
  const NiveauDeuxCapitalesPage({Key? key}) : super(key: key);
  @override
  _NiveauDeuxCapitalesPageState createState() => _NiveauDeuxCapitalesPageState();
}

class _NiveauDeuxCapitalesPageState extends State<NiveauDeuxCapitalesPage> {
  ///PageController
  final PageController _controller = PageController(initialPage: 0);

  ///Mise en place de la variable de jeu
  bool isPressed = false;

  ///Couleur par défaut des choix
  Color btnColor = primaryColor;

  int selectedQuestion = 0;

  ///Score
  int scoreDeux = 0;

  ///vérification réponse
  bool isJust = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: capitale_deux.length,
          itemBuilder: (context, index) {
            return ListView(
              children: [
                ///Affichage du numéro de question
                Container(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "QUESTION ${index + 1} sur ${capitale_deux.length}",
                                style: extrabold22White,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ///Affichage du drapeau
                Text(
                    "${capitale_deux[index].capital}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ///Affichage des réponses possibles
                for (int i = 0; i < capitale_deux[index].answer!.length; i++)
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? capitale_deux[index].answer!.entries.toList()[i].value
                          ? trueAnswer
                          : falseAnswer
                          : greyColor,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),

                      ///Lorsque l'on appuie sur une des réponses
                      onPressed: () {
                        setState(() {
                          isPressed = true;
                        });
                        if (capitale_deux[index]
                            .answer!.entries
                            .toList()[i]
                            .value) {
                          scoreDeux += 1;
                          isJust = false;
                        }
                      },
                      child: Image(
                        image: AssetImage("assets/geographic/${capitale_deux[index].answer!.keys.toList()[i]}"),
                        height: 50.0,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //Bouton prochaine question et résultat
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/CapitalesQuiz");
                    },
                    child: const Text(
                      "Quitter",
                      style: bold20Primary,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  OutlinedButton(
                    onPressed: isPressed
                        ? index + 1 == capitale_deux.length
                        ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CapitaleQuizResultLevelTwoScreen(scoreLevelTwo: scoreDeux)
                          ));
                    }
                        : () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      setState(() {
                        isPressed = false;
                        isJust = true;
                      });
                    }
                        : null,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      ///Si on arrive à la fin des capitale_deux du niveau, alors on affiche le résultat
                      index + 1 == capitale_deux.length
                          ? "Voir les résultats"
                          : "Suivant",
                      style: const TextStyle(
                          color: whiteColor,
                          fontFamily: 'frenchScript',
                          fontSize: 20.0),
                    ),
                  ),
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}

