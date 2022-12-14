part of 'page_bloc.dart';

abstract class PageState {
  const PageState();
}

class PageInitial extends PageState {}

class OnHomePage extends PageState {}

class OnTopicPage extends PageState {
  List<TopicModel> list;

  OnTopicPage(this.list);
}

class OnRulesPage extends PageState {}

class OnQuizPage extends PageState {
  List<QuizModel> list;

  OnQuizPage(this.list);
}

class OnResultPage extends PageState {
  final List<QuizModel> list;
  final int totalCorrect;
  final int totalNotAnswered;

  OnResultPage(this.list, this.totalCorrect, this.totalNotAnswered);
}

class OnReviewPage extends PageState {
  List<QuizModel> list;

  OnReviewPage(this.list);
}