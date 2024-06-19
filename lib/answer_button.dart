import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerStr, this.onTap, {super.key});
  final String answerStr;
  final void Function(String) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: (){
          onTap(answerStr);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          backgroundColor: const Color.fromARGB(255, 58, 33, 243),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          answerStr,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
