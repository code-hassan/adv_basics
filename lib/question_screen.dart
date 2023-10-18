

import 'package:adv_basics/answere_button.dart';
import 'package:adv_basics/data/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionScreen extends StatefulWidget {

  const QuestionScreen({super.key, required this.onSelectedAnswer});
  final void Function(String answer) onSelectedAnswer;


  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectedAnswer(selectedAnswer);
   // currentQuestionIndex = currentQuestionIndex + 1;
   // currentQuestionIndex += 1;
      setState(() {
        currentQuestionIndex++;
      });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Text(
             currentQuestion.text,
             style: GoogleFonts.lato(
               color: const Color.fromARGB(255, 201, 153, 251),
               fontWeight: FontWeight.bold,
               fontSize: 24,
             ),
             textAlign: TextAlign.center,
           ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer,
                  onTap: (){
                    answerQuestion(answer);
                  }
              );
            }),
          ],
        ),
      ),
    );
  }
}
