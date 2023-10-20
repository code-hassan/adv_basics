import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start_screen";
   List<String> _selectedAnswers = [];
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen =  StartScreen(switchScreen);
  //   super.initState();
  // }
  void switchScreen(){
    // setState(() {
    //   activeScreen = const QuestionScreen();
    // });

    setState(() {
       activeScreen = "question_screen";
    });

  }

  void chooseAnswer(String answer){
    _selectedAnswers.add(answer);
    if(_selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = "result_screen";
      });
    }


  }
  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }


  @override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == "question_screen"){
      screenWidget =   QuestionScreen(onSelectedAnswer: chooseAnswer);
    }
     if(activeScreen == "result_screen"){
       screenWidget =  ResultScreen(
         chosenAnswers: _selectedAnswers,
                  onRestart: restartQuiz,
       );
     }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 167),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
