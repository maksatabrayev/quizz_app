class QuizQuestion{
  final String text;
  final List<String> answers;
  
  const QuizQuestion(this.text, this.answers);
  List<String> getShuffledAnswers(){
   List<String> newList = List.of(answers);
   newList.shuffle();
   return newList;
  }
}