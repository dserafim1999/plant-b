import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/pages/scanner/scanner.dart';
import 'package:plant_b/popups/code_popup.dart';


class ActivityPopup extends StatelessWidget {
  final Activity activity;

  const ActivityPopup({
    Key? key,
    required this.activity
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Future openScanner() => Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const Scanner()),
               );

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: const EdgeInsets.all(20.0),
      content: SizedBox(
        height: 600,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              child: Container(
                height: 175.0,
                width: 300.0,
                child: ClipRRect(
                  child: Image.network(activity.img_url, fit: BoxFit.fitHeight),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: const Color(0xffe5e5e5),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(activity.getLabel(), style: headline2),
                              const SizedBox(height: 20,),
                              Text(activity.description, style: headline4),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  Text("Max Participants: ", style: headline2),
                                  Text(activity.max_number_participants.toString(), style: headline4),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Status: ", style: headline2),
                                  Text(activity.status.toUpperCase(), style: headline4),
                                ],
                              ),
                            ],
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Token Reward:", style: headline2),
                                Row(
                                  children: [
                                    Text(activity.token_reward.toString(), style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 5),
                                    CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/token.png"))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                /*
                                ElevatedButton(
                                  onPressed: () {
                                    // Respond to button press
                                  },
                                  style:  ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(const Color(0xff63982e)),
                                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                                  ),
                                  child: Text('Back'),
                                ),*/
                                ElevatedButton(
                                  onPressed: () {
                                    openScanner();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff63982e),
                                      onPrimary: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                      textStyle: const TextStyle(fontSize: 20)
                                  ),
                                  child: const Text('Scan'),
                                ),
                              ],
                            )
                          ],
                        ),
                      )

            ],
                )
            ),
          ],
        ),
      ),
    );
  }

}



