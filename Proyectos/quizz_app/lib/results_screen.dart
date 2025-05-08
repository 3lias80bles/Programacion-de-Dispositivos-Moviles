import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers});
  final List<String>selectedAnswers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              Text("Pregunta 1: ${listQuestions[0].textQuestion}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              ),SizedBox(height: 10,),

              Text("Respuesta Correcta: ${listQuestions[0].textQuestion}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              ),SizedBox(height: 10,),

              Text("Respuesta Seleccionada: ${listQuestions[0].textQuestion}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
              ),SizedBox(height: 10,),

              SizedBox(height: 20,),
              ElevatedButton.icon(
                onPressed: (){},
                  icon:Icon(Icons.ads_click),
                  label:Text("Home"),
              ),
            ],
          ),
        ),
    );
  }
}
