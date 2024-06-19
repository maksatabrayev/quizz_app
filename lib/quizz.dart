import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quizz extends StatefulWidget{
  const Quizz({super.key});

  @override
  State<Quizz> createState() {
    return _QuizzState(); 
  }
  
}

class _QuizzState extends State<Quizz>{
  Widget? currentScreen;
  List<String> selectedAnswers = [];
  
  _QuizzState(){
    selectedAnswers = [];
  }


  void addAnswer(String newAnswer){
    selectedAnswers.add(newAnswer);
  }
  @override
  void initState() {
    super.initState();
    currentScreen  = StartScreen(changeScreen);
  }

  void changeScreen(){
    setState(() {
      currentScreen = QuestionsScreen(addAnswer, showResults);
    });
  }

  void showResults(){
      setState(() {
        currentScreen =  ResultsScreen(selectedAnswers: selectedAnswers, restartQuizz: restartQuizz);
      });
  }

 void restartQuizz(){
  setState(() {
    currentScreen = StartScreen(changeScreen);
  },);
 }
  @override
  Widget build(BuildContext context) {
     return   MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          body: currentScreen
        ),
      );
  }
  
}