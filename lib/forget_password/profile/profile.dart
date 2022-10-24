import 'package:flutter/material.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ColorNotifier notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getlightblue,
    );
  }
}
