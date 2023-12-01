import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'answer_button.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key,required this.onAnswer, required this.onAction}) : super(key: key);


  final Function(String value) onAnswer;
  final Function(String value) onAction;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].question,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 28),
            ),
            ...questions[currentQuestionIndex]
                .getRandomAnswers()
                .map((answer) => AnswerButton(
                value: answer,
                onAnswer: () {
                  answerQuestion(answer);
                })),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  widget.onAction('start');
                },
                child: const Text(
                  'Back to Start',
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ))
          ],
        ),
      ),
    );
  }
}