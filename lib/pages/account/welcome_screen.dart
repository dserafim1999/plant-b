import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:plant_b/main.dart';
import "package:plant_b/core/styles.dart";

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

// ------------------ Custom config ------------------
class WelcomeScreenState extends State<WelcomeScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title:
        "WELCOME TO",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Before we start, here are a few of the features you will be able to access in our application.",
        styleDescription: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Image.asset(
          'assets/logo_text.png',
          width: 300,
        ),
        backgroundColor: const Color(0xff86C24B),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );

    slides.add(
      Slide(
        title:
        "Performing activities will grant you Tokens",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Activities include Recycling, Eco-Events, Voluntary Work and more...",
        styleDescription: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: 100, height: 100, child: Icon(Icons.room, size: 100, color: Colors.white)),
                  Container(child: Text("Find an activity near you", style: TextStyle(fontSize: 18, color: Colors.white)))
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: 100, height: 100, child: Icon(Icons.qr_code_scanner, size: 100, color: Colors.white,)),
                  Container(child: Text("Scan the QR Code at the location", style: TextStyle(fontSize: 18, color: Colors.white)))
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: 100, height: 85, child: CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/token.png"))),
                  Container(child: Text("Receive tokens", style: TextStyle(fontSize: 18, color: Colors.white)))
                ],
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xff86C24B),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );

    slides.add(
      Slide(
        title:
        "Rewards can be redeemed in exchange for Tokens",
        maxLineTitle: 3,
        styleTitle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Tokens can be used to redeem Rewards.",
        styleDescription: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: AssetImage("assets/token.png"),
              radius: 100,
            )
          ],
        ),
        backgroundColor: const Color(0xff86C24B),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );

    slides.add(
      Slide(
        title:
        "Social interaction",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Add Friends to check their progress and rankings",
        styleDescription: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 100, height: 100, child: Icon(Icons.qr_code_scanner, size: 100, color: Colors.white,)),
                      Container(child: Text("Scan a Friend's Code to add them", style: TextStyle(fontSize: 18, color: Colors.white)))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 100, height: 100, child: Icon(Icons.person_add, size: 100, color: Colors.white)),
                      Container(child: Text("Generate a QR Code for you", style: TextStyle(fontSize: 18, color: Colors.white)))
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(width: 100, height: 100, child: Icon(Icons.assessment, size: 100, color: Colors.white)),
                      Container(child: Text("Check ranking on Leaderboard", style: TextStyle(fontSize: 18, color: Colors.white)))
                    ],
                  ),
                ],
              ),
          ),
        backgroundColor: const Color(0xff86C24B),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );
  }




  void onDonePress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  Widget renderNextBtn() {
    return const Text(
        "Next",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        )
    );
  }

  Widget renderDoneBtn() {
    return const Text(
      "Done",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      )
    );
  }

  Widget renderSkipBtn() {
    return const Text(
      "Skip",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      )
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff86C24B)),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0xff86C24B)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: slides,

      // Skip button
      renderSkipBtn: renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Colors.grey,
      colorActiveDot: Colors.white,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: false,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}