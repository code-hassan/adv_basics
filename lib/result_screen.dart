import 'package:adv_basics/question_summery.dart';
import 'package:flutter/material.dart';

import 'data/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;



   List<Map<String,Object>> get summeryData{
    final List<Map<String,Object>> summery = [];

    for(var i = 0 ; i < chosenAnswers.length ; i++){
      summery.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
   return summery;

  }




  @override
  Widget build(BuildContext context) {


    // final summeryData = getSummeryData();
     final numbTotalQuestion = questions.length;
     final numbCorrectQuestion = summeryData.where((data)
       =>  data['user_answer'] == data['correct_answer'],
     ).length;


    return SizedBox(
        width: double.infinity,
        child: Container(
        margin: const EdgeInsets.all(40),
    child:  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text("You answered $numbCorrectQuestion out of $numbTotalQuestion question correctly!"),
      const SizedBox(height: 30,),
      QuestionSummery(summeryData),
      const SizedBox(height: 30,),
      TextButton(
          onPressed: (){},
          child: const Text("Restart Quiz!"),
      ),
    ],
    ),
        ),
    );
  }
}
