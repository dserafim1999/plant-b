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
        description: "Activities such as Recycling, transporting other user's waste to Recycling Bins, participating in city-wide events, and many more...",
        styleDescription: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        marginDescription: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.room),
                  Container(child: Text("Find an activity near you", style: TextStyle(fontSize: 18, color: Colors.white)))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.center_focus_strong),
                  Text("Scan the QR Code at the location to register an activity", style: TextStyle(fontSize: 18, color: Colors.white))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundColor: Colors.green, radius: 15),
                  Text("Receive tokens", style: TextStyle(fontSize: 18, color: Colors.white))
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
        maxLineTitle: 2,
        styleTitle: const TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "Rewards include discounts and free public transportation tickets.",
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
              radius: 75,
            )
          ],
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