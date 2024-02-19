import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget{
  const QuestionScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}



class _QuestionScreenState extends State<QuestionScreen>{
  var currentQuestionIndex = 0;


  void answerQuestion (String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers); 
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    // esto es una alternativa a envolver la column en un widget center
    return   SizedBox(
      //significa que llena todo el espacio
      width: double.infinity,
      //hay que envolver la columna en un contenedor para asi poder ponerle margen a la pantalla con el EdgeInsets
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          //El eje principal de una Column es el eje vertical
                mainAxisAlignment: MainAxisAlignment.center,
                //establece la alineación transversal(el eje horizontal) y el .stretch se refiere a que los elementos dentro del oclumn se estirarán para ser tan anchos como sea posible
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.text,
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 201, 153, 251),
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                      textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  //El map permite transformar las listas de answer en lista de botones y los ... saca esa lista de botones de manera individual para que oslo sea unalista de widgets y no unalista de lista de widgets
                  ... currentQuestion.getShuffleList().map((answer) {
                    return AnswerButton(
                      answer, 
                      onTap: (){
                        answerQuestion(answer);
                      },
                    );
                  }
                  ),
                ],
        ),
      ),
    );
  }
}