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
                  const Text("Are you sure you want to redeem this ticket?", style: headline, textAlign: TextAlign.center),
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
                          addUserTicket(loggedUser, ticket.qr_code);
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
            ClipRRect(
              child: Container(
                height: 175.0,
                width: 300.0,
                child: ClipRRect(
                  child: Image.network(ticket.img_url, fit: BoxFit.fitHeight),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                Container(
                    width: 300,
                    height: 155,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(ticket.name, style: headline2),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Amount: ", style: headline2),
                                  Text(ticket.amount.toString(), style: TextStyle(fontSize: 18)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Valid for: ", style: headline2),
                                  Text('6 months', style: TextStyle(fontSize: 18)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Token Cost:  ", style: headline2),
                                  Row(
                                    children: [
                                      Text(ticket.token_cost.toString(), style: TextStyle(fontSize: 18)),
                                      SizedBox(width: 5),
                                      CircleAvatar(radius: 10, backgroundImage: AssetImage("assets/token.png"))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),
                const SizedBox(height: 20),
                FutureBuilder(
                    future: login(loggedUser),
                    builder: (context, AsyncSnapshot projectSnap) {
                      if (projectSnap.connectionState == ConnectionState.none &&
                          projectSnap.hasData == false) {
                        return Container();
                      } else if (projectSnap.hasData) {
                        User user = projectSnap.data;

                        return Container(width: 300, height: 150, decoration: BoxDecoration(
                          color: const Color(0xffe5e5e5),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(user.img_url),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                  Text("ID: " + user.cc.toString())
                                ],
                              )
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }
                ),
                const SizedBox(height: 25),
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



