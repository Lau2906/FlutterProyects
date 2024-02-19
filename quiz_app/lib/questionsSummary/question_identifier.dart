import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{
  const QuestionIdentifier(this.indexQuestion, this.isCorrect, {super.key});

  final int indexQuestion;
  final bool isCorrect;

  @override
  Widget build( context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 150, 198, 241)
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(
        indexQuestion.toString(),
        style: 
          const TextStyle(
            color: Color.fromARGB(255, 22, 2, 56),
            fontWeight: FontWeight.bold
          ),),
    );
  }

}