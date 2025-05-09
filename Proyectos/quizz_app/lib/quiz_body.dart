//Importaciones necesarias
import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

//Clase principal que representa la pantalla de preguntas
class QuizBody extends StatefulWidget {//StatefulWidget permite que el estado de la pantalla cambie
  const QuizBody({super.key, required this.addSelectedAnswers});
  final void Function(String) addSelectedAnswers;
  @override
  State<QuizBody> createState() => _QuizBodyState();
}
//Recibe la respuesta seleccionada
class _QuizBodyState extends State<QuizBody> {
  int _questionNumber = 0;
  void onSelectedAnswer(String answers) {
    widget.addSelectedAnswers(answers);
    setState(() {
      _questionNumber++;
    });
  }
//Lista de preguntas
  @override
  Widget build(BuildContext context) {
    Question currentQuestion = listQuestions[_questionNumber];
    return Scaffold(
      body: Container(
        
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [const Color.fromARGB(255, 159, 214, 228), Color.fromRGBO(67, 185, 254, 1)],
            radius: 0.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,//alinea al centro 
            children: [
              Text(
                currentQuestion.textQuestion,
                style: TextStyle(
                  fontSize:
                      50, // Aumenta este valor para hacer el texto más grande
                  fontWeight: FontWeight.bold, // Opcional: para hacerlo negrita
                ),
                textAlign: TextAlign.center,// Alinea el texto al centro  
              ),
              SizedBox(height: 50),
              ...currentQuestion.shuffleAnswers().map((answer) {// Mapea las respuestas aleatorias
                return Column(
                  children: [
                    SizedBox(height: 50),//espacio entre las respuestas
                    ElevatedButton(
                      onPressed: (){
                        onSelectedAnswer(answer);//llama a la función onSelectedAnswer para seleccionar la respuesta y guardar la respuesta seleccionada
                        },
                      child: Text(answer),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
