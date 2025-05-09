import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers, required this.goToHome,});
  final List<String> selectedAnswers;
  final VoidCallback goToHome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar
          children: [
            Text(
              "Pregunta 1: ${listQuestions[0].textQuestion}",
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            Text(
              "Respuesta Correcta: ${listQuestions[0].answers[0]}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            Text(
              "Respuesta Seleccionada: ${selectedAnswers[0]}",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: goToHome,
              icon: Icon(Icons.ads_click),
              label: Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
