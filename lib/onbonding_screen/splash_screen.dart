import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(context,
          PageTransition(type: PageTransitionType.fade, child: SecondScreen())),
    );
  }

  late ColorNotifier notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: notifire.getprimerycolor,
          body: Container(
              color: notifire.getprimerycolor,
              child: Center(
                  child: Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Image.asset("image/batting app icon.png")))),
        );
      },
    );
  }
}
