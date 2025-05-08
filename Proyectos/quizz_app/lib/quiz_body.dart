import 'package:flutter/material.dart';
import 'package:quizz_app/question.dart';

class QuizBody extends StatefulWidget {
  const QuizBody({super.key, required this.addSelectedAnswers});
  final void Function(String) addSelectedAnswers;
  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int _questionNumber = 0;
  void onSelectedAnswer(String answers) {
    widget.addSelectedAnswers(answers);
    setState(() {
      _questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = listQuestions[_questionNumber];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Color.fromRGBO(254, 119, 67, 12)],
            radius: 0.5,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.textQuestion,
                style: TextStyle(
                  fontSize:
                      50, // Aumenta este valor para hacer el texto más grande
                  fontWeight: FontWeight.bold, // Opcional: para hacerlo negrita
                ),
              ),
              SizedBox(height: 50),
              ...currentQuestion.shuffleAnswers().map((answer) {
                return Column(
                  children: [
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (){
                        onSelectedAnswer(answer);
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
