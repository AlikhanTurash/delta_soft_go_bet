import 'package:flutter/material.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:gobet/globals.dart';

import 'matches.dart';

class Finish_match extends StatefulWidget {
  const Finish_match({Key? key}) : super(key: key);

  @override
  _Finish_matchState createState() => _Finish_matchState();
}

class _Finish_matchState extends State<Finish_match> {
  late ColorNotifier notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);

    final val = ModalRoute.of(context)!.settings.arguments as double;
    String lostPointsString = val.toStringAsFixed(0);
    int lostPointsInt = val.toInt();

    setState(() {
      global.points -= lostPointsInt;
    });

    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: Matches()));
              },
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Icon(Icons.close, color: Colors.red, size: 200),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            const Text(
              "Sorry!",
              style: TextStyle(
                  color: Color(0xfff6f6f5),
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            Text(
              "You have lost $lostPointsString pts.",
              style: TextStyle(color: Color(0xffe6eef7)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Matches()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 23,
                    width: MediaQuery.of(context).size.width / 1.7,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xffDA22FF),
                          Color(0xff9733EE),
                          Color(0xffDA22FF),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: Color(0xffe2e3e9),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: Matches()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height / 23,
                    width: MediaQuery.of(context).size.width / 9,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color(0xff2b2f54)),
                    child: const Center(
                        child: Icon(
                      Icons.delete_outline,
                      color: Color(0xff8899cc),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
