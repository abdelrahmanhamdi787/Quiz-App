import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/summary.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswer, this.restart, {super.key});

  final List<String> selectedAnswer;
  final void Function() restart;

  List<Map<String, Object>> get _summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorrectAnswers = _summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'you aswered $numOfCorrectAnswers out of ${questions.length} questions correct',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Summary(_summaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: restart,
            icon: Icon(Icons.restart_alt_outlined, color: Colors.white),
            label: Text(
              'Restart Quiz!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
