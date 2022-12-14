import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/page/page_bloc.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({Key? key}) : super(key: key);

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
          title: Text("Rules"),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff393E44),
              ),
              onPressed: () => context.read<PageBloc>().add(GoToHomePage()),
            )
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06,),
              child: Text("1. jumlah soal adalah 10",textAlign: TextAlign.center ,style: rulesTextStyle())
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
              child: Text("2. soal yang dikeluarkan adalah acak",textAlign: TextAlign.center, style: rulesTextStyle()),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
              child: Text("3. Waktu pengerjaan 1 soal adalah 20 detik",textAlign: TextAlign.center, style: rulesTextStyle()),
            ),
            Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
              child: Text("4. Soal yang sudah terlewat tidak bisa dikerjakan lagi",textAlign: TextAlign.center, style: rulesTextStyle())
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  bottom: MediaQuery.of(context).size.height * 0.03
              ),
              child: ElevatedButton(
                onPressed: () => context.read<PageBloc>().add(GoToQuizPage()),
                child: Text(
                  "Play Now",
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
            )
          ],
        ),
      ),
    );
  }

  TextStyle rulesTextStyle() {
    return TextStyle(
      fontSize: 20
    );
  }
}
