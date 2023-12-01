import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'models/quiz_question.dart';

class ResultScreen extends StatelessWidget {

  const ResultScreen({Key? key, required this.answerList, required this.onAction}) : super(key: key);


  final List<String> answerList;
  final Function(String value) onAction;

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }
    return summary;
  }

  int countCorrectAnswers() {
    int correctCount = 0;

    for (var i = 0; i < answerList.length; i++) {
      if (questions[i].answers[0] == answerList[i]) {
        correctCount++;
      }
    }

    return correctCount;
  }

    @override
    Widget build(BuildContext context) {
      return  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Result Screen',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 28),
            ),
            Center(child: Text('Total Correct Answers: ${countCorrectAnswers()} out of ${answerList.length}')),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getSummary().map((s) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Question number: ${(s['questionIndex'] as int) + 1}'),
                    Text('Question: ${s['question']}'),
                    Text('Correct Answer: ${s['correct_answer']}'),
                    Text('User Answer: ${s['user_answer']}'),
                    SizedBox(height: 20),  // Adjust the height as desired
                  ],
                )).toList(),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  onAction('start');
                },
                child: const Text('Restart'))


          ],

        ),

      );
    }
  }

