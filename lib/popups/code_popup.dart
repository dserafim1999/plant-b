import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:qr_flutter/qr_flutter.dart';


class CodePopup extends StatelessWidget {

  final String label;
  final String qrCodeValue;
  final String description;

  const CodePopup({
    Key? key,
    required this.label,
    required this.qrCodeValue,
    required this.description
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
            Text(label, style: headline),
            const SizedBox(height: 20),
            QrImage(
                data: qrCodeValue,
                size: 275,
                backgroundColor: Colors.white,
            ),
            const SizedBox(height: 20),
            Container(
                width: 300,
                height: 300,
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
                              Text(description, style: headline4),
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
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff63982e),
                                      onPrimary: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                      textStyle: const TextStyle(fontSize: 20)
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



