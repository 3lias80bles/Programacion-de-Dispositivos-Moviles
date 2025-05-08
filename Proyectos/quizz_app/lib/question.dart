class Question {
  const Question({required this.textQuestion, required this.answers});
  final String textQuestion;
  final List<String>answers;
  List<String> shuffleAnswers(){
    final copyOfList = List.of(answers);
    copyOfList.shuffle();
    return copyOfList;
  }

  }
final listQuestions=[
    Question(textQuestion: "¿Cómo estas?", answers: ["Bien","Mal","Feliz","Masomenos"]),
    Question(textQuestion: "¿Cúal es tu clase favorita?", answers: ["Ing.Soft","Redes","Programación"]),
    Question(textQuestion: "¿Qué quieres comer?", answers: ["Maruchan","Ensalada"]),
    Question(textQuestion: "¿Te gusta el maicra?", answers: ["si","no","Masomenos"]),
    ];