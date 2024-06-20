import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers, required this.restartQuizz});

  final List<String> selectedAnswers;
  final void Function() restartQuizz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summaryData;
  }


  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final questionNumber = questions.length;
    final correctAnswersNumber = summaryData.where(
      (element) {
        return element['correct_answer'] == element['user_answer'];
      },
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswersNumber questions out of $questionNumber correct',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuizz,
              label: const Text("Restart", style: TextStyle(color: Colors.white),),
              icon: const Icon(Icons.restart_alt, color: Colors.white),
              
            ),
          ],
        ),
      ),
    );
  }
}
