class QuestionsModel {
  const QuestionsModel(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffeldAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
