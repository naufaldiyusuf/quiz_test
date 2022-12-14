import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_test/bloc/blocs.dart';

import '../model/models.dart';

class TopicScreen extends StatelessWidget {
  List<TopicModel> list;

  TopicScreen(this.list);

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
          title: Text("All Topic"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xff393E44),
            ),
            onPressed: () => context.read<PageBloc>().add(GoToHomePage()),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          children: list.map(
                  (e) => Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
                    alignment: Alignment.center,
                    color: Colors.blueAccent,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.065,
                    child: Text(
                        e.topicName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        )
                    ),
                  )
                ],
              )).toList(),
        ),
      ),
    );
  }
}
