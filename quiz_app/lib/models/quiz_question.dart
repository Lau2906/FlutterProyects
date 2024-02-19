class QuizQuestion{
  const QuizQuestion(this.text, this.asnwer);

  final String text;
  final List<String> asnwer;

  List <String> getShuffleList() {
    final shuffledList = List.of(asnwer);
    shuffledList.shuffle();
    return shuffledList;
  }
}