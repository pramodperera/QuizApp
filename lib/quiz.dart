import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'start_screen.dart';
import 'question_screen.dart';
import 'result_screen.dart';

class Quizwidget extends StatefulWidget {
  const Quizwidget({Key? key}) : super(key: key);

  @override
  State<Quizwidget> createState() => _QuizwidgetState();
}

class _QuizwidgetState extends State<Quizwidget> {
  String activeScreen = 'start';
  List<String> selectedAnswers = [];

  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }

  void onAnswerSelect(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  void onRestart(String value) {
    setState(() {
      selectedAnswers = [];
      activeScreen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen ;

    if (activeScreen == 'start') {
      currentScreen = StartScreen(onAction: onScreenChange);
    }

    if (activeScreen == 'quiz') {
      currentScreen =
          QuestionScreen(onAnswer: onAnswerSelect, onAction: onScreenChange);
    }

    if (activeScreen == 'result') {
      currentScreen =
          ResultScreen(onAction: onRestart, answerList: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey])),
        child: currentScreen,
      )),
    );
  }
}
