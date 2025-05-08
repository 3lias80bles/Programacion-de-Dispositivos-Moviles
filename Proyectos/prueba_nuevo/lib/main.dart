import 'package:flutter/material.dart';

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
                  label:Text("Home"),
              ),
            ],
          ),
        ),
    );
  }
}