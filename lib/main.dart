import 'package:flutter/material.dart';
import 'package:plant_b/pages/account/welcome_screen.dart';
import 'package:plant_b/pages/activities/map.dart';
import 'package:plant_b/pages/rewards/rewards.dart';
import 'package:plant_b/pages/social/social.dart';
import 'package:plant_b/pages/profile/profile.dart';
import 'package:plant_b/pages/account/sign_in.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ActivitiesMap(),
    const Rewards(),
    const Social(),
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
                icon: Icon(Icons.supervisor_account),
                label: "Social",
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
