import 'package:flutter/material.dart';

class TextFieldProvider extends ChangeNotifier {
  TextEditingController textController = TextEditingController();

  TextFieldProvider() {
    textController.addListener(() {
      notifyListeners();
    });
  }



  int counter = 0;

  void Increase() {
    counter++;
    notifyListeners();
  }

  void Decrease() {
    if (counter > 0) {
      counter--;
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("The counter can not be negative")),
    //   );
    // }
    notifyListeners();
  }

  void Reset() {
    counter = 0;
    notifyListeners();
  }

  bool flag = false;

  void toggle(bool value) {
    flag = !flag;
    notifyListeners();
  }



 int teamAScore = 0;
  int teamBScore = 0;

  void addTeamPoints(int points, String teamChar) {
      if (teamChar == 'A') {
        teamAScore += points;
      } else if (teamChar == 'B') {
        teamBScore += points;
      }
      notifyListeners();
  }
  
  void resetScore() {
      teamAScore = 0;
      teamBScore = 0;
      notifyListeners();
  }



}
