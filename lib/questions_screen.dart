import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.addAnswer, this.showResults, {super.key});
 final void Function() showResults;
 final void Function(String) addAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  int questionCounter = 0;
   
  _QuestionScreenState(){
      questionCounter = 0;
  }
  void onTap(String answer) {
    widget.addAnswer(answer);
    if(questionCounter < questions.length -1){
      setState(() {
        questionCounter ++;
      });
    }
    else{  
      widget.showResults();
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[questionCounter].text,
              style: GoogleFonts.lato(
               color: Colors.white,
               fontSize: 24
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...questions[questionCounter]
                .getShuffledAnswers().map((e) {
                 return AnswerButton(e, onTap);
                },)
          ],
        ),
      ),
    );
  }
}
