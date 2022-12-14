import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../bloc/page/page_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
              width: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset("assets/idea_lamp.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
              child: Text(
                "Flutter Quiz App",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.03
              ),
              child: ElevatedButton(
                onPressed: () => context.read<PageBloc>().add(GoToRulesPage()),
                child: Text(
                  "Play",
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
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () => context.read<PageBloc>().add(GoToTopicPage()),
                child: Text(
                  "Topic",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.lightBlue
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    side: BorderSide(
                      width: 2,
                      color: Colors.lightBlue
                    ),
                    primary: Colors.white
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
              child: GestureDetector(
                onTap: () => Share.share("Check out this flutter quiz app! https://github.com/naufaldiyusuf/quiz_test"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.share, size: 30,),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("Share", style: TextStyle(fontSize: 15),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
