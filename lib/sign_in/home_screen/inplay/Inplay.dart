import 'package:flutter/material.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:provider/provider.dart';

class Inplay extends StatefulWidget {
  const Inplay({Key? key}) : super(key: key);

  @override
  _InplayState createState() => _InplayState();
}

class _InplayState extends State<Inplay> {
  late ColorNotifier notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      // bottomNavigationBar: buildBottomNavigationBar(context),
      backgroundColor: notifire.getprimerycolor,
    );
  }
}
