import  'package:flutter/material.dart';



class quizWidget extends StatelessWidget {
  const quizWidget({Key? key}) : super(key: key);


  void onScrrenChange(){

  }

  @override
  Widget build(BuildContext context) {

    if(activeScreen=='start')
    return   MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black,Colors.white]
            )
          ),
            child: const Text('Welcome to Quiz App',style: TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),)
        ),
        
        
      ),
      
      
    );
  }
}
