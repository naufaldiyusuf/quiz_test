import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/bloc/blocs.dart';
import 'package:quiz_test/screen/home_screen.dart';
import 'package:quiz_test/screen/quiz_screen.dart';
import 'package:quiz_test/screen/result_screen.dart';
import 'package:quiz_test/screen/review_screen.dart';
import 'package:quiz_test/screen/rules_screen.dart';
import 'package:quiz_test/screen/splash_screen.dart';
import 'package:quiz_test/screen/topic_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, state) {
          if (state is OnHomePage) {
            return HomeScreen();
          } else if (state is OnTopicPage) {
            return TopicScreen(state.list);
          } else if (state is OnRulesPage) {
            return RulesScreen();
          } else if (state is OnQuizPage) {
            return QuizScreen(state.list);
          } else if (state is OnResultPage) {
            return ResultScreen(state.list, state.totalCorrect, state.totalNotAnswered);
          } else if (state is OnReviewPage) {
            return ReviewScreen(state.list);
          } else {
            Future.delayed(Duration(seconds: 2), () {
              context.read<PageBloc>().add(GoToHomePage());
            });
            return SplashScreen();
          }
        });
  }
}
