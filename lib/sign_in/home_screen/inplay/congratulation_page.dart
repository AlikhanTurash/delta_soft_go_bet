import 'package:flutter/material.dart';
import 'package:gobet/sign_in/home_screen/inplay/Inplay.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:gobet/globals.dart';

import '../matches/matches.dart';

class Congratulation_page extends StatefulWidget {
  double val;
  Congratulation_page(this.val, {Key? key}) : super(key: key);

  @override
  _Congratulation_pageState createState() => _Congratulation_pageState();
}

class _Congratulation_pageState extends State<Congratulation_page> {
  late ColorNotifier notifire;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    final val = ModalRoute.of(context)!.settings.arguments as double;
    double winPoints = val * 1.79;
    String winPointsString = winPoints.toStringAsFixed(0);
    int winPointsInt = winPoints.toInt();

    setState(() {
      global.points += winPointsInt;
    });

    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: Matches()));
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            Center(
              child: Image.asset(
                "image/win.png",
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const Text(
              "Congratulations",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Gilroy Bold', fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Text(
              "You won the match & earned +$winPointsString point ",
              style: TextStyle(
                  fontFamily: 'Gilroy Medium',
                  color: Color(0xffaab7d4),
                  fontSize: 10),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
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
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff3030b2),
                      Color(0xff322e9e),
                      Color(0xff4b32b4),
                      Color(0xff5233b4),
                      Color(0xff492f9a),
                    ],
                  ),
                ),
                child: const Center(
                    child: Text(
                  "Return To Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gilroy Bold',
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
