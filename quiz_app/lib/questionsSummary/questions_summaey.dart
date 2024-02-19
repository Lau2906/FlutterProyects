import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questionsSummary/question_identifier.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary(this.summaryData, {super.key});

  final List< Map<String, Object>> summaryData;

  @override
  Widget build( context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map( 
            (data) {
              final isCorrectAnswer = data['user_answer'] == data['correctAnswer'];
              final index = (data['question_index'] as int) + 1;
              return Row(children: [
                QuestionIdentifier(index,isCorrectAnswer),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String, 
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 202, 171, 252),
                        ),
                      ),
                      Text(
                        data['correctAnswer'] as String,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 181, 254, 246),
                        ),
                      ),
                    ],
                  ),
                ),
              ],);
            }
          ).toList(),
        ),
      ),
    );
  }
}