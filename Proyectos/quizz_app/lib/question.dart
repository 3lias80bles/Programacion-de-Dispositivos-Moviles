//Este archivo contiene la clase Question, que representa una pregunta y sus respuestas posibles.
class Question {
  const Question({required this.textQuestion, required this.answers});
  final String textQuestion;
  final List<String> answers;
  List<String> shuffleAnswers() {
    final copyOfList = List.of(answers);
    copyOfList.shuffle();
    return copyOfList; //Esta función devuelve una lista de respuestas aleatorias
  }
}

//Esta lista contiene las preguntas y respuestas posibles.
final listQuestions = [
  Question(
    textQuestion:
        "¿Qué componente es considerado el 'cerebro' de la computadora?",
    answers: ["CPU", "Monitor", "Teclado", "Mouse"],
  ),
  Question(
    textQuestion:
        "¿Qué dispositivo se usa para escribir texto en la computadora?",
    answers: ["Teclado", "Mouse", "Monitor", "Impresora"],
  ),
  Question(
    textQuestion: "¿Cómo se llama la memoria temporal de la computadora?",
    answers: ["RAM", "Disco duro", "USB", "CD-ROM"],
  ),
  Question(
    textQuestion:
        "¿Qué dispositivo muestra imágenes y texto en la computadora?",
    answers: ["Monitor", "CPU", "Teclado", "Router"],
  ),
];
