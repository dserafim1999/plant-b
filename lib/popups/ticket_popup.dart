import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:plant_b/popups/code_popup.dart';
import 'package:plant_b/models/ticket.model.dart';


class TicketPopup extends StatelessWidget {
  final Ticket ticket;

  const TicketPopup({
    Key? key,
    required this.ticket
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Future openCodeDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return CodePopup(label:"Ticket Code", qrCodeValue: ticket.qr_code, description: "Present this code to redeem your ticket at the designated ticket sale locations. This code is personal and  can only be used once. You can access it again in the Profile Menu.",);
        }
    );

    Future openConfirmationDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: const EdgeInsets.all(20.0),
            content: Container(
              height: 200,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text("Are you sure you want to redeem these tickets?", style: headline, textAlign: TextAlign.center),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff63982e),
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 20)
                        ),
                        child: const Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          openCodeDialog();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff63982e),
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            textStyle: const TextStyle(fontSize: 20)
                        ),
                        child: const Text('Yes'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
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
            Text(ticket.getLabel(), style: headline),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 40),
                const Text("Passenger Info"),
                const SizedBox(height: 20),
                Container(width: 300, height: 150, decoration: BoxDecoration(
                    color: const Color(0xffe5e5e5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const CircleAvatar(radius: 45),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(loggedUser.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("ID: " + loggedUser.cc.toString())
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text("Tickets"),
                const SizedBox(height: 20),
                Container(
                    width: 300,
                    height: 150,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Tokens Required: "+ ticket.token_cost.toString(), style: headline2),
                                const SizedBox(height: 20,),
                              ],
                            ),
                          )

                ],
                    )
                ),
                const SizedBox(height: 55),
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
                        openConfirmationDialog();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff63982e),
                          onPrimary: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          textStyle: const TextStyle(fontSize: 20)
                      ),
                      child: const Text('Confirm'),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}



