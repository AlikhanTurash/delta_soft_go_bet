import 'package:flutter/material.dart';
import 'package:gobet/sign_in/home_screen/inplay/Inplay.dart';
import 'package:gobet/sign_in/home_screen/matches/matches.dart';
import 'package:gobet/sign_in/home_screen/sports/sports.dart';
import 'package:gobet/utils/color_notifier.dart';
import 'package:provider/provider.dart';

import 'forget_password/profile/profile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.purple,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xff6978A0).withOpacity(.80),
        backgroundColor: notifier.getprimerycolor,
        selectedLabelStyle: const TextStyle(fontFamily: 'Gilroy_Medium'),
        fixedColor: Colors.purple,
        unselectedLabelStyle: const TextStyle(fontFamily: 'Gilroy_Medium'),
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              backgroundColor: notifier.getprimerycolor,
              icon: Image.asset("image/matches.png",
                  color: const Color(0xff4e586e),
                  height: MediaQuery.of(context).size.height / 30),
              label: 'Matches'),
          BottomNavigationBarItem(
              backgroundColor: notifier.getprimerycolor,
              icon: Image.asset("image/sports.png",
                  height: MediaQuery.of(context).size.height / 30),
              label: 'Sports'),
          BottomNavigationBarItem(
              backgroundColor: notifier.getprimerycolor,
              icon: Image.asset("image/inplay.png",
                  height: MediaQuery.of(context).size.height / 30),
              label: 'Inplay'),
          BottomNavigationBarItem(
            backgroundColor: notifier.getprimerycolor,
            icon: Image.asset("image/user1.png",
                color: const Color(0xff4e586e),
                height: MediaQuery.of(context).size.height / 30),
            label: 'User',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3),
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const Matches(),
          const Sports(),
          const Inplay(),
          const Profile(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
