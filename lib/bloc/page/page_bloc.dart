import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_test/bloc/blocs.dart';
import 'package:quiz_test/model/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(PageInitial pageInitial) : super(PageInitial()) {
    on<PageEvent>((event, emit) async {
      if (event is GoToHomePage) {
        emit(OnHomePage());
      } else if (event is GoToTopicPage) {
        List<TopicModel> list = [];
        final topics = await FirebaseFirestore.instance.collection("topic").get();

        if (topics.docs.isNotEmpty) {
          topics.docs.forEach((e) {
            list.add(TopicModel.fromJson(e.data()));
          });
        }

        emit(OnTopicPage(list));
      } else if (event is GoToRulesPage) {
        emit(OnRulesPage());
      } else if (event is GoToQuizPage) {
        List<QuizModel> list = [];
        List<QuizModel> listRandomLimit = [];

        final quizes = await FirebaseFirestore.instance.collection("quiz").get();

        if (quizes.docs.isNotEmpty) {
          quizes.docs.forEach((e) {
            list.add(QuizModel.fromJson(e.data()));
          });
        }

        list.shuffle();

        for (int i = 0; i < 10; i++) {
          listRandomLimit.add(list[i]);
        }

        emit(OnQuizPage(listRandomLimit));
      } else if (event is GoToResultPage) {
        int totalCorrect = 0;
        int totalNotAnswered = 0;
        event.list.forEach((e) {
          if (e.correct.isEmpty) {
            totalNotAnswered++;
          } else {
            if (e.correct == "correct") {
             totalCorrect++;
            }
          }

          emit(OnResultPage(event.list, totalCorrect, totalNotAnswered));
        });
      } else if (event is GoToReviewPage) {
        emit(OnReviewPage(event.list));
      }
    });
  }
}