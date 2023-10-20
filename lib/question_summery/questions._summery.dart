import 'package:adv_basics/question_summery/summery_item.dart';
import 'package:flutter/cupertino.dart';

class QuestionSummery extends StatelessWidget {
  const QuestionSummery(this.summeryData,{super.key});
  final List<Map<String,Object>> summeryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData.map((data) {
            return SummeryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}