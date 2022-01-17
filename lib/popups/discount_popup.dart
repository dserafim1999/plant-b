import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/discount.model.dart';
import 'package:plant_b/popups/code_popup.dart';


class DiscountPopup extends StatelessWidget {
  final Discount? discount;

  const DiscountPopup({
    Key? key,
    this.discount
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Future openCodeDialog() => showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CodePopup(label:"Discount Code", qrCodeValue: "value", description: "description",);
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
                  Text("Are you sure you want to redeem this discount?", style: headline, textAlign: TextAlign.center),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style:  ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xff63982e)),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                        ),
                        child: Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          openCodeDialog();
                        },
                        style:  ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color(0xff63982e)),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                        ),
                        child: Text('Yes'),
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
        height: 650,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("Redeem Discount", style: headline),
            const SizedBox(height: 20),
            Container(width: 300, height: 175, decoration: BoxDecoration(
                color: const Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(20.0)
            )),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Discount Name", style: headline2),
                              SizedBox(height: 20,),
                              Text("eqdiygwihfoiejf ohoufihwiuegf iygiefweig fywgeuf gywg eiuiufgieuwg fiugweiuf iuwg efiugwiegf iugweiuf gwiuef iuwgeifugwiugf iwueg fiuwegiuwgiugfw eiug fiuw feuiwwiufeuiwfiuwgfewuigwfe", style: headline4),
                            ],
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Tokens Required: 1000 ( )", style: headline2),
                            SizedBox(height: 20,),
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
                                  style:  ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(const Color(0xff63982e)),
                                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                                  ),
                                  child: Text('Confirm'),
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



