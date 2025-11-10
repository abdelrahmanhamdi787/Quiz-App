import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/question.dart';
import 'package:quiz/result.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = Result(selectedAnswer, restart);
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = Home(switchScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
