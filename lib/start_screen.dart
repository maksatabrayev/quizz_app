import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  final String imageSTR = 'assets/images/quizz-image.png';

  const StartScreen(this.startQuizz, {super.key});
  final void Function() startQuizz;
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imageSTR),
              const SizedBox(width: 20, height: 20),
              const Text(
                'Learn it the fun way!',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(width: 20, height: 20),
              OutlinedButton.icon(
                  label: const Text(
                    "Start quizz",
                ),
                  onPressed: startQuizz,
                  style: OutlinedButton.styleFrom(backgroundColor: Colors.pink),
                  icon: const Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
