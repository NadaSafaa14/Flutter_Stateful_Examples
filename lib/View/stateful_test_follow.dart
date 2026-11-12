import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_week_flutter/View/Provider/TextFieldProvider.dart';

class StatefulTestFollow extends StatefulWidget {
  const StatefulTestFollow({super.key});

  @override
  State<StatefulTestFollow> createState() => _StatefulTestFollowState();
}

class _StatefulTestFollowState extends State<StatefulTestFollow> {
  double value = 0;

  void change(double value1) {
    setState(() {
      value = value1;
    });
  }

  // int teamAScore = 0;
  // int teamBScore = 0;

  // void addTeamPoints(int points, String teamChar) {
  //   setState(() {
  //     if (teamChar == 'A') {
  //       teamAScore += points;
  //     } else if (teamChar == 'B') {
  //       teamBScore += points;
  //     }
  //   });
  // }

  // void addTeamPointsBool(int points, bool teamA) {
  //   setState(() {
  //  teamA? teamAScore+=points:teamBScore+=points;
  //   });
  // }

  // void addTeamAPoints(int points) {
  //   setState(() {
  //     teamAScore += points;
  //   });
  // }

  // void addTeamBPoints(int points) {
  //   setState(() {
  //     teamBScore += points;
  //   });
  // }

  // void resetScore() {
  //   setState(() {
  //     teamAScore = 0;
  //     teamBScore = 0;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    TextFieldProvider BasketProvider = Provider.of<TextFieldProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 235, 235),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: Text(
          "BasketBall",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),

              Row(
                children: [
                  TeamSection(
                    teamName: "Team A",
                    score: BasketProvider.teamAScore,
                    addPoints: BasketProvider.addTeamPoints,
                    teamChar: 'A',
                  ),

                  Container(height: 400, width: 1.5, color: Colors.blueGrey),

                  TeamSection(
                    teamName: "Team B",
                    score: BasketProvider.teamBScore,
                    addPoints: BasketProvider.addTeamPoints,
                    teamChar: 'B',
                  ),
                ],
              ),

              Spacer(),

              SizedBox(
                width: 160,
                height: 48,

                child: ElevatedButton(
                  onPressed: BasketProvider.resetScore,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  child: Text(
                    "Reset",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text("Value : ${value.toStringAsFixed(1)}"),
                ),
              ),

              Spacer(), // Slider(
              //   value: value,
              //   onChanged: change,
              //   activeColor: Colors.pink,
              //   min: 0,
              //   max: 100,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamSection extends StatelessWidget {
  String teamName;
  int score;
  Function(int, String) addPoints;
  String teamChar;

  TeamSection({
    super.key,
    required this.teamName,
    required this.score,
    required this.addPoints,
    required this.teamChar,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            teamName,
            style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 13, 58, 95),
            ),
          ),

          // const SizedBox(height: 10),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 105,
              color: Color.fromARGB(255, 13, 58, 95),
            ),
          ),

          SizedBox(height: 20),

          ScoreButton(
            text: 'Add 1 Point',
            points: 1,
            addPoints: addPoints,
            teamChar: teamChar,
          ),

          const SizedBox(height: 12),

          ScoreButton(
            text: 'Add 2 Points',
            points: 2,
            addPoints: addPoints,
            teamChar: teamChar,
          ),

          const SizedBox(height: 12),

          ScoreButton(
            text: 'Add 3 Points',
            points: 3,
            addPoints: addPoints,
            teamChar: teamChar,
          ),
        ],
      ),
    );
  }
}

class ScoreButton extends StatelessWidget {
  String text;
  int points;
  Function(int, String) addPoints;
  String teamChar;

  ScoreButton({
    super.key,
    required this.text,
    required this.points,
    required this.addPoints,
    required this.teamChar,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 48,

      child: ElevatedButton(
        onPressed: () {
          addPoints(points, teamChar);
        },

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),

        child: Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
