import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:provider/provider.dart';

class Loses extends StatefulWidget {
  const Loses({Key? key}) : super(key: key);

  @override
  _LosesState createState() => _LosesState();
}

class _LosesState extends State<Loses> {
  late CountdownTimerController controller;
  int endTime = DateTime.now().millisecondsSinceEpoch + 7200 * 12000;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late ColorNotifier notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getprimerycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            League("Football,Champions League", "Splash FC", "UC Sampdoria",
                "image/logo2.png", "image/logo3.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            League("Premier League", "Fc Barcelona", "UC Sampdoria",
                "image/logo5.png", "image/logo6.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            League("Football,Champions League", "Fc Barcelona", "UC Sampdoria",
                "image/logo12.png", "image/basketball.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            League("Premier League", "Splash FC", "UC Sampdoria",
                "image/logo15.png", "image/logo19.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget League(name1, name3, name4, img1, img2) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
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
              Text(
                name1,
                style: const TextStyle(
                    color: Color(0xff8a9dcf),
                    fontFamily: 'Gilroy Medium',
                    fontSize: 12),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      img1,
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Text(
                      name3,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Score("2.42"),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    const Text(
                      "Live",
                      style: TextStyle(
                          fontFamily: 'Gilroy Medium', color: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: CountdownTimer(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            fontFamily: 'Gilroy Medium',
                            color: Color(0xff4e80fe),
                            fontWeight: FontWeight.w500),
                        onEnd: onEnd,
                        endTime: endTime,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    const Text(
                      "21.16",
                      style: TextStyle(
                          fontFamily: 'Gilroy Medium',
                          color: Colors.white,
                          fontSize: 11),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Score("1.01"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      img2,
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Text(
                      name4,
                      style: const TextStyle(
                          fontFamily: 'Gilroy Medium', color: Colors.white),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    Score("1.79")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Score(name) {
    return Container(
      height: MediaQuery.of(context).size.height / 23,
      width: MediaQuery.of(context).size.width / 5,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff8f94b0)),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
              color: Color(0xffe2e3e9),
              fontFamily: 'Gilroy Medium',
              fontSize: 15),
        ),
      ),
    );
  }
}
