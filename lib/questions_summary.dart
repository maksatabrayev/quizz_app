import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                   padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] == data['correct_answer']
                            ? Colors.blue
                            : Colors.red),
                    child: Text(data['question_index'].toString())),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          data["question"].toString(),
                          style:
                              GoogleFonts.lato(color: Colors.white, fontSize: 16),
                         textAlign: TextAlign.left,
                        ),
                      ),
                       
                       Text(
                          data['user_answer'].toString(),
                          textAlign: TextAlign.left,
                        ),
                      
                         Text(
                          data["correct_answer"].toString(),
                          style: const TextStyle(color: Colors.cyan),
                      )
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
