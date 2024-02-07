import 'package:audioplayers/audioplayers.dart';

class QuestionModel {
  int? niveau;
  String? music;
  Map<String,bool> answer;
  //String? morceau;
  //String? compositeur;

  //Creating the constructor
QuestionModel(this.niveau, this.music, this.answer);//, this.morceau, this.compositeur);
}