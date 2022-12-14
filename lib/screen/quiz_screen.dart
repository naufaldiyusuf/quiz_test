import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/page/page_bloc.dart';
import '../model/models.dart';

class QuizScreen extends StatefulWidget {
  List<QuizModel> list;

  QuizScreen(this.list);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 15;
  int currentSeconds = 0;
  bool timerUp = false;
  late Timer timerPeriodic;


  startTimeout([int milliseconds = 0]) {
    var duration = interval;
    timerPeriodic = Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          currentSeconds = timer.tick;
          if (timer.tick >= 15) {
            timer.cancel();
            timerUp = true;
            nextStep("");
          }
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      currentSeconds = 0;
      timerUp = false;
    });
    startTimeout();
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToRulesPage());
        return false;
      },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Question ${currentIndex+1}"),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff393E44),
              ),
              onPressed: () => context.read<PageBloc>().add(GoToRulesPage()),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 35, top: 10),
                child: Text("${timerMaxSeconds - currentSeconds}", style: TextStyle(fontSize: 20)),
              )
            ],
          ),
          body: ListView(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                child: Text(
                  "Topic : ${widget.list[currentIndex].topicName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                alignment: Alignment.center,
                child: Text(
                    widget.list[currentIndex].question,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.1
                ),
                child: ElevatedButton(
                  onPressed: () => nextStep(widget.list[currentIndex].optionOne),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Text(
                      widget.list[currentIndex].optionOne,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      primary: Colors.lightBlue
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.03
                ),
                child: ElevatedButton(
                  onPressed: () => nextStep(widget.list[currentIndex].optionTwo),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Text(
                      widget.list[currentIndex].optionTwo,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      primary: Colors.lightBlue
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.03
                ),
                child: ElevatedButton(
                  onPressed: () => nextStep(widget.list[currentIndex].optionThree),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Text(
                      widget.list[currentIndex].optionThree,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      primary: Colors.lightBlue
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.03
                ),
                child: ElevatedButton(
                  onPressed: () => nextStep(widget.list[currentIndex].optionFour),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Text(
                      widget.list[currentIndex].optionFour,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      primary: Colors.lightBlue
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  void nextStep(String answer) {
    if (answer.isNotEmpty) {
      if (answer == widget.list[currentIndex].answer) {
        widget.list[currentIndex] = widget.list[currentIndex].copyWith(correct: "correct", optionChoosen: answer);
      } else {
        widget.list[currentIndex] = widget.list[currentIndex].copyWith(correct: "incorrect", optionChoosen: answer);
      }
      setState(() {});
    }

    if ((currentIndex + 1) == widget.list.length) {
      context.read<PageBloc>().add(GoToResultPage(widget.list));
    } else {
      currentIndex++;
      timerPeriodic.cancel();
      timerUp = true;
      setState(() {});
      resetTimer();
    }
  }
}
