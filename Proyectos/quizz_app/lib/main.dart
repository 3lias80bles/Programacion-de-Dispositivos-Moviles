//Sergio Elias Robles Ignacio

// Importación de paquetes
import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/quiz_body.dart';
import 'package:quizz_app/results_screen.dart';

//Función para iniciar el programa
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Pantalla que se muestra actualmente
  //Widget? currentScreen;
  String currentScreen = "home-screen";
  //@override
  // void initState(){
  //   currentScreen=HomePage(startQuiz: switchScreen);
  //   super.initState();
  // }
  //Lista para guardar las Respuestas
  final List<String> selectedAnswers = [];

  //Función que cambia al la pantalla de preguntas
  void switchScreen() {
    setState(() {
      currentScreen = "question-screen";
      selectedAnswers.clear();
      //currentScreen=QuizBody();
    });
  }

  //Función para agegar un respuesta
  void addSelectedAnswers(String answer) {
    selectedAnswers.add(answer);
    //print(selectedAnswers);
    //Si se seleccionaron todas las respuestas cambia de pantalla
    if (selectedAnswers.length == listQuestions.length) {
      setState(() {
        currentScreen = "results-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = HomePage(startQuiz: switchScreen);
    //si la pantalla actual es la de preguntas
    //se muestra la pantalla de preguntas

    if (currentScreen == "question-screen") {
      screen = QuizBody(addSelectedAnswers: addSelectedAnswers);//llama a la función addSelectedAnswers para agregar la respuesta seleccionada
    }
    if (currentScreen == "results-screen") {
      screen = ResultsScreen(
        selectedAnswers: selectedAnswers,
        goToHome: () {//Se crea para regresar a la pantalla de inicio
          setState(() {
            currentScreen = "home-screen"; // Cambia a la pantalla de inicio
          });
        },
      );
    }
    return MaterialApp(
      title: 'quizz',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 3, 91, 255),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 134, 132, 146),
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            textStyle: TextStyle(fontSize: 25),//tamaño de la letra
            iconSize: 25,
            iconColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      home: screen, //Pantalla de inicio
    );
  }
}

//Pantalla de inicio
class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.startQuiz});
  final void Function() startQuiz;
  //Función que inicia el quiz
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//centrar
          children: [
            Image.asset('assets/images/quiz.png', width: 250),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: startQuiz,//llama a la función que inicia el quiz al presionar el botón
              icon: Icon(Icons.ads_click),
              label: Text("Iniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
