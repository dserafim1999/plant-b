import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';


class CodePopup extends StatelessWidget {

  final String label;
  final String qrCodeValue;
  final String description;

  const CodePopup({
    Key? key,
    this.label = '',
    this.qrCodeValue = '',
    this.description = ''
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      contentPadding: const EdgeInsets.all(20.0),
      content: Container(
        height: 650,
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(label, style: headline),
            const SizedBox(height: 20),
            //generate qrcode
            Container(width: 250, height: 250, decoration: BoxDecoration(
                color: const Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(20.0)
            )),
            const SizedBox(height: 20),
            Container(
                width: 300,
                height: 325,
                decoration: BoxDecoration(
                  color: const Color(0xffe5e5e5),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("How It Works", style: headline2),
                              SizedBox(height: 20,),
                              Text("eqdiygwihfoiejf ohoufihwiuegf iygiefweig fywgeuf gywg eiuiufgieuwg fiugweiuf iuwg efiugwiegf iugweiuf gwiuef iuwgeifugwiugf iwueg fiuwegiuwgiugfw eiug fiuw feuiwwiufeuiwfiuwgfewuigwfe", style: headline4),
                            ],
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                    Navigator.pop(context);
                                  },
                                  style:  ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(const Color(0xff63982e)),
                                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                                      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20))
                                  ),
                                  child: Text('Close'),
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



