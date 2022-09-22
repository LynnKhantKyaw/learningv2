class QuizOne {
  String? multiSelect;
  String? answer;

  QuizOne({
    required this.multiSelect,
    this.answer,
  });
}

List<QuizOne> quizList1 = [
  QuizOne(multiSelect: 'question 1', answer: 'question 1'),
  QuizOne(multiSelect: 'question 2', answer: 'question 2'),
  QuizOne(
    multiSelect: 'question 3',
  ),
  QuizOne(
    multiSelect: 'question 4',
  ),
  QuizOne(
    multiSelect: 'question 5',
  ),
];
