part of 'page_bloc.dart';

abstract class PageEvent {
  const PageEvent();
}

class GoToHomePage extends PageEvent {}

class GoToTopicPage extends PageEvent {}

class GoToRulesPage extends PageEvent {}

class GoToQuizPage extends PageEvent {}

class GoToResultPage extends PageEvent {
  final List<QuizModel> list;

  GoToResultPage(this.list);
}

class GoToReviewPage extends PageEvent {
  List<QuizModel> list;

  GoToReviewPage(this.list);
}