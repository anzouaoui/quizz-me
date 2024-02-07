import 'package:audioplayers/audioplayers.dart';

class QuestionAnimeModel {
  int? niveau;
  String? music;
  Map<String,bool> answer;

  //Creating the constructor
  QuestionAnimeModel(this.niveau, this.music, this.answer);
}