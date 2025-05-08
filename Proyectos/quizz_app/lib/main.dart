import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';
import 'package:quizz_app/quiz_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  //Widget? currentScreen;
  String currentScreen="home-screen";
  //@override
  // void initState(){
  //   currentScreen=HomePage(startQuiz: switchScreen);
  //   super.initState();
  // }
  final List<String> selectedAnswers  = [];

    void switchScreen(){
    setState(() {
      currentScreen = "question-screen";
      selectedAnswers.clear();
      //currentScreen=QuizBody();
    });
  }

  void addSelectedAnswers(String answer){
    selectedAnswers.add(answer);
    print(selectedAnswers);

    if(selectedAnswers.length == listQuestions.length){
      setState(() {
        currentScreen="home-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = HomePage(startQuiz: switchScreen);
    if(currentScreen == "question-screen"){
      screen = QuizBody(addSelectedAnswers: addSelectedAnswers);
    }
    return MaterialApp(
      title: 'quizz',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown,
            foregroundColor: Colors.blue,
            textStyle: TextStyle(fontSize: 50),
            iconSize: 24,
            iconColor: Colors.green
          ),
        ),
      ),
      home: screen,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key,required this.startQuiz});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/quiz.jpg', width: 250),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: startQuiz,
                  icon:Icon(Icons.ads_click),
                  label:Text("Iniciar"),
              ),
            ],
          ),
        ),
    );
  }
}
