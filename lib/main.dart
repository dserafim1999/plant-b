import 'package:flutter/material.dart';
import 'package:plant_b/pages/activities/map.dart';
import 'package:plant_b/pages/rewards/rewards.dart';
import 'package:plant_b/pages/scanner/scanner.dart';
import 'package:plant_b/pages/leaderboard/leaderboard.dart';
import 'package:plant_b/pages/profile/profile.dart';
import 'package:plant_b/pages/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //home: const MyHomePage(),
      home: const SignIn(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ActivitiesMap(),
    const Rewards(),
    const Leaderboard(),
    const Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xff86C24B),
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            selectedItemColor: const Color(0xff86C24B),
            unselectedItemColor: Colors.grey[350],
            iconSize: 30,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Activities",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.spa),
                label: "Rewards",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart),
                label: "Leaderboard",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "Profile",
              ),
            ],
          ),
        )
      ),
    );
  }
}
