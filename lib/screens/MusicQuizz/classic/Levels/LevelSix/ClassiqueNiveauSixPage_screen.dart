///****************************************************************
///********************** NIVEAU 6 ********************************
///****************************************************************

import 'package:rc_fl_quiz_app/screens/MusicQuizz/classic/Results/classic_quiz_result_level_six.dart';
import 'package:rc_fl_quiz_app/screens/MusicQuizz/classic/data/classque_niveau_six_question_list.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';
import 'package:audioplayers/audioplayers.dart';

class ClassiqueNiveauSixPage extends StatefulWidget {
  const ClassiqueNiveauSixPage({Key? key}) : super(key: key);
  @override
  _ClassiqueNiveauSixPageState createState() => _ClassiqueNiveauSixPageState();
}

class _ClassiqueNiveauSixPageState extends State<ClassiqueNiveauSixPage> {
  ///PageController
  final PageController _controller = PageController(initialPage: 0);

  ///Mise en place de la variable de jeu
  bool isPressed = false;

  ///Musique lancée ou pas
  bool isPlayed = false;

  ///Couleur par défaut des choix
  Color btnColor = primaryColor;

  ///variable AudioPlayer
  final player = AudioPlayer();

  int selectedQuestion = 0;

  ///Score
  int scoreSix = 0;

  ///vérification réponse
  bool isJust = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions_six.length,
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
                                "QUESTION ${index + 1} sur ${questions_six.length}",
                                style: extrabold22White,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                ///Affichage de la question
                const SizedBox(
                  height: 20.0,
                ),
                ///Affichage du bouton play
                IconButton(
                  icon: !isPlayed? play:pause,
                  onPressed: () {
                    setState(() {
                      isPlayed = true;
                    });
                    String url = "music/${questions_six[index].music!}";
                    player.play(AssetSource(url));
                  },
                  iconSize: 120.0,
                  color: !isPlayed ? playIcon : pauseIcon,
                ),
                const SizedBox(
                  height: 20.0,
                ),

                ///Affichage des réponses possibles
                for (int i = 0; i < questions_six[index].answer.length; i++)
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 8.0),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions_six[index].answer.entries.toList()[i].value
                          ? trueAnswer
                          : falseAnswer
                          : greyColor,
                      padding: const EdgeInsets.symmetric(vertical: 18.0),

                      ///Lorsque l'on appuie sur une des réponses
                      onPressed: () {
                        setState(() {
                          isPressed = true;
                        });
                        if (questions_six[index]
                            .answer.entries
                            .toList()[i]
                            .value) {
                          scoreSix += 1;
                          isJust = false;
                        }
                      },
                      child: Text(
                        questions_six[index].answer.keys.toList()[i],
                        style: const TextStyle(
                          color: whiteColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //Bouton prochaine question et résultat
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/MusicQuiz");
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
                        ? index + 1 == questions_six.length
                        ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuizResultLevelSixScreen(scoreLevelSix: scoreSix)
                          ));
                      player.stop();
                    }
                        : () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                      setState(() {
                        isPressed = false;
                        player.stop();
                        isJust = true;
                        isPlayed = false;
                      });
                    }
                        : null,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: Text(
                      ///Si on arrive à la fin des questions_six du niveau, alors on affiche le résultat
                      index + 1 == questions_six.length
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