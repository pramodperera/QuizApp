import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({Key? key, required this.onAction}) : super(key: key);

  final Function(String value) onAction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'images/quiz-cover.png',
            width: 300,

          ),
          const Text(
            'Let\'s do some refreshment on Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          OutlinedButton(
            onPressed: (){
              onAction('quiz');
            },
            child: const Text('Start Quiz'),
          )

        ],
      ),
    );
  }
}
