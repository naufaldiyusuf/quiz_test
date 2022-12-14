import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/page/page_bloc.dart';
import '../model/models.dart';

class ResultScreen extends StatelessWidget {
  final List<QuizModel> list;
  final int totalCorrect;
  final int totalNotAnswered;

  ResultScreen(this.list, this.totalCorrect, this.totalNotAnswered);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.read<PageBloc>().add(GoToHomePage());
          return false;
        },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Result"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xff393E44),
            ),
            onPressed: () => context.read<PageBloc>().add(GoToHomePage()),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                child: Text(
                  "${totalCorrect * 10}",
                  style: TextStyle(
                      fontSize: 50
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                child: Text(
                  "Total Correct : $totalCorrect",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Total Incorrect : ${10 - totalCorrect}",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Not Answered : $totalNotAnswered",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () => context.read<PageBloc>().add(GoToHomePage()),
                        child: Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
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
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () => context.read<PageBloc>().add(GoToReviewPage(list)),
                        child: Text(
                          "Review",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            primary: Colors.lightGreen
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
