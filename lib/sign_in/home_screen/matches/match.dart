import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gobet/sign_in/home_screen/inplay/congratulation_page.dart';
import 'package:gobet/sign_in/home_screen/matches/comments.dart';
import 'package:gobet/sign_in/home_screen/matches/matches.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:gobet/globals.dart';

import '../../../forget_password/profile/wallet/wallet.dart';
import 'match_finish.dart';
import 'participated.dart';

class Live_match extends StatefulWidget {
  const Live_match({Key? key}) : super(key: key);

  @override
  _Live_matchState createState() => _Live_matchState();
}

class _Live_matchState extends State<Live_match> {
  double val = 100;

  late ColorNotifier notifire;

  int bet = 100;

  bool win = true;

  late Timer _everySecond;

  @override
  void initState() {
    super.initState();
    _everySecond = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);

    String StringPoints = global.points.toString();

    return Scaffold(
      // bottomNavigationBar: buildBottomNavigationBar(context),
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
                  width: MediaQuery.of(context).size.width / 40,
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
                      color: notifire.getwhite,
                    )),
                const Spacer(),
                Container(
                  height: MediaQuery.of(context).size.height / 25,
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: const BoxDecoration(
                      color: Color(0xffC028F8),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Image.asset("image/uil-wallet.png"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 100,
                        ),
                        Text(
                          '$StringPoints pts.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Gilroy Bold'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff252a4a),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        const Text(
                          "Football,Champions League",
                          style:
                              TextStyle(color: Color(0xff8a9dcf), fontSize: 12),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.account_tree_outlined,
                          color: Colors.grey,
                          size: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 30,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "image/logo5.png",
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            const Text(
                              "Splash FC",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 23,
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff8f94b0)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "2.42",
                                  style: TextStyle(
                                      color: Color(0xffe2e3e9),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            const Text(
                              "Live",
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 70,
                            ),
                            const Text(
                              "0:0",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff4e80fe),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 50,
                            ),
                            const Text(
                              "21.16",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 70,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 23,
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff8f94b0)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "1.01",
                                  style: TextStyle(
                                      color: Color(0xffe2e3e9),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "image/logo3.png",
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            const Text(
                              "UC Sampdoria",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 100,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 23,
                              width: MediaQuery.of(context).size.width / 5,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff8f94b0)),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "1.79",
                                  style: TextStyle(
                                      color: Color(0xffe2e3e9),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    const Divider(
                      color: Color(0xff6e7daa),
                      thickness: 1,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
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
                                    type: PageTransitionType.fade,
                                    child: Comments()));
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 30,
                            width: MediaQuery.of(context).size.width / 10,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.message_outlined,
                                  size: 16,
                                  color: Color(0xff8b99c8),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 90,
                                ),
                                const Text(
                                  "50",
                                  style: TextStyle(
                                    color: Color(0xff8b99c8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                        const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 16,
                          color: Color(0xff8b99c8),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 90,
                        ),
                        const Text(
                          "5051",
                          style: TextStyle(
                            color: Color(0xff8b99c8),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 9,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Participated()));
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height / 30,
                            child: Row(
                              children: [
                                const Text(
                                  "Participated:",
                                  style: TextStyle(
                                      color: Color(0xff8b99c8), fontSize: 10),
                                ),
                                // SizedBox(
                                //   width: MediaQuery.of(context).size.width / 70,
                                // ),
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius:
                                          MediaQuery.of(context).size.height /
                                              100,
                                      child: CircleAvatar(
                                        radius:
                                            MediaQuery.of(context).size.height /
                                                48,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            const AssetImage("image/man.png"),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                        ),
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100,
                                              child: CircleAvatar(
                                                radius: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    48,
                                                backgroundColor: Colors.white,
                                                backgroundImage:
                                                    const AssetImage(
                                                        "image/man.png"),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      40,
                                                ),
                                                Stack(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              100,
                                                      child: CircleAvatar(
                                                        radius: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            48,
                                                        backgroundColor:
                                                            Colors.white,
                                                        backgroundImage:
                                                            const AssetImage(
                                                                "image/man.png"),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              40,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          radius: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              100,
                                                          child: CircleAvatar(
                                                            radius: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                48,
                                                            backgroundColor:
                                                                const Color(
                                                                    0xff415ff7),
                                                            child: const Text(
                                                              "+30",
                                                              style: TextStyle(
                                                                  fontSize: 6,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Text(
              val.toStringAsFixed(0),
              style: TextStyle(
                  color: Color(0xfffaf9fb),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'pts.',
              style: TextStyle(
                  color: Color(0xfffaf9fb),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
              activeColor: const Color(0xff4d7cfe),
              inactiveColor: const Color(0xff2b2f54),
              value: val,
              min: 100,
              max: 1000,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "POOL",
                        style:
                            TextStyle(color: Color(0xffa4baf0), fontSize: 11),
                      ),
                      Text(
                        "100pts.",
                        style: TextStyle(
                            color: Color(0xffa4baf0),
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "TO WIN",
                        style:
                            TextStyle(color: Color(0xffa4baf0), fontSize: 11),
                      ),
                      Text(
                        "1 000pts.",
                        style: TextStyle(
                            color: Color(0xffa4baf0),
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => isWon()
                                ? Congratulation_page(val)
                                : Finish_match(),
                            settings: RouteSettings(arguments: val)),
                      );
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
                      child: Center(
                        child: Row(
                          children: [
                            SizedBox(width: 90),
                            Text(
                              "Bet ",
                              style: TextStyle(
                                  color: Color(0xffe2e3e9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              val.toStringAsFixed(0),
                              style: TextStyle(
                                  color: Color(0xffe2e3e9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Text(
                              "pts.",
                              style: TextStyle(
                                  color: Color(0xffe2e3e9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  //SizedBox(width: MediaQuery.of(context).size.width / 30,),
                  Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  isWon() {
    var random = Random();
    int outcome = random.nextInt(2);
    win = true;
    if (outcome == 1) {
      win = true;
      print('1');
    } else {
      win = false;
      print('0');
    }
    return win;
  }
}
