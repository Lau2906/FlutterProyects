import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questionsSummary/questions_summaey.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.restartQuiz,{super.key});

  final void Function() restartQuiz;

  final List<String> chosenAnswers;

  List< Map<String, Object>> getSummaryData(){
    final List< Map<String, Object>> summary = [];

  for(var i = 0; i < chosenAnswers.length; i++){
    summary.add({
      'question_index': i,
      'question': questions[i].text,
      'correctAnswer': questions[i].asnwer[0],
      'user_answer': chosenAnswers[i]
      }
    );
  }

    return summary;
  }

  @override
  Widget build( context) {
    final summaryData = getSummaryData();
    final numTotalQuestiones = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correctAnswer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestiones questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: restartQuiz, 
              style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Restart Quiz!')
            ),
          ],
        ),
      ),
    );
  }
}