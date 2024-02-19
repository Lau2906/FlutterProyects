import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/star_screen.dart';
import 'package:quiz_app/results_screen.dart';

const starAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  //la lista puede se final a pesar de querer agregarle datos ya que esopno cambia el numero en memoria si se reasignara eso si altera la memoria y no se puede
  List<String> selectedAnswers = [];
  //opcion con el init
  Widget? activeScreen;
  //opcion sin el init y menos codigo
  // var activeScreen = 'start-screen'

  @override
  void initState(){
    activeScreen =  StarScreen(switchScreen);
    super.initState();
  }

void switchScreen(){
  setState((){
    //opción con init
    activeScreen = QuestionScreen(chooseAnswer);
    if(selectedAnswers.length == questions.length){
      selectedAnswers=[];
    }
    //opcion sin el init y menos codigo
    //activeScreen = 'question-screen'
  });
}

void chooseAnswer(String answer) {
  selectedAnswers.add(answer);

  if(selectedAnswers.length == questions.length){
    setState((){
      activeScreen = ResultScreen(selectedAnswers,switchScreen);
    });
  }
}
   @override
  Widget build(context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(160, 83, 238, 0.957),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: starAlignment,
              end: endAlignment,
            ),
          ),
          child: 
            //opción con init
            activeScreen,
            //opción sin init con expresión ternaria y se puede hacer igual pero con if    
            // activeScreen == 'start-screen'
            // ? StartScreen(switchScreen)
            // : const QuestionsScreen()
        ),
      ),
    );
  }
}