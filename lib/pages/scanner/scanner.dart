import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
import 'package:plant_b/models/activity.model.dart';
import 'package:plant_b/models/user.model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;
  String code = "";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Future<void> reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    if(isActivity()) {
      addUserActivity(loggedUser, code);
      return FutureBuilder(
        future: getActivity(code),
        builder: (context, AsyncSnapshot projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == false) {
            return Container(
              color: const Color(0xff86C24B),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            );
          } else if (projectSnap.hasData) {
            Activity activity = projectSnap.data;
            return buildActivityResult(context, activity);
          } else {
            return Container();
          }
        },
      );
    } else if(isFriend()) {
      addUserFriend(loggedUser, int.parse(code));
      return FutureBuilder(
        future: getUser(int.parse(code)),
        builder: (context, AsyncSnapshot projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none &&
              projectSnap.hasData == false) {
            return Container(
                color: const Color(0xff86C24B),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                )
            );
          } else if (projectSnap.hasData) {
            User friend = projectSnap.data;
            return buildFriendResult(context, friend);
          } else {
            return Container();
          }
        },
      );
    }


    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff86C24B),
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            const Positioned(
              child: Text("Point the camera at a QR code", style: headline1),
              bottom: 650,
            ),
            Positioned(child: buildInvalidResult(), bottom: 10)
          ],
        ),
      ),
    );

  }

  Widget buildQrView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderLength: 25,
        borderWidth: 20,
        borderRadius: 5,
        borderColor: Colors.white,
        overlayColor: const Color(0xff86C24B).withOpacity(0.9),
        cutOutSize:  MediaQuery.of(context).size.width * 0.8
      ),
  );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) => setState(() {
      this.barcode = barcode;
      code = barcode.code!;
    }));
  }

  Widget buildActivityResult(BuildContext context, Activity activity) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff86C24B),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Activity Scanned!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("You will receive", style: TextStyle(color: Colors.white, fontSize: 28)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(activity.token_reward.toString(), style: TextStyle(color: Colors.white, fontSize: 100)),
                      SizedBox(width: 20),
                      CircleAvatar(radius: 50, backgroundImage: AssetImage("assets/token.png"))
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("Tokens", style: TextStyle(color: Colors.white, fontSize: 28)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("(Your balance will be updated shortly. This could take up to 60 seconds)", textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
              ),
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
                child: const Text('Back'),
              ),
            ],
          ),
        ),
    );
  }
  Widget buildFriendResult(BuildContext context, User friend) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff86C24B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Friend Added!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 105,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(friend.img_url),
                  ),
                ),
                SizedBox(height: 30),
                Text(friend.name, style: TextStyle(color: Colors.white, fontSize: 28)),
              ],
            ),
            SizedBox(height: 20,),
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
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );

    /*return Scaffold(
      body: Container(
        color: const Color(0xff86C24B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Friend added!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 62,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(friend.img_url),
                  ),
                ),
                SizedBox(height: 30),
                Text(friend.name, style: TextStyle(color: Colors.white, fontSize: 28)),
              ],
            ),
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
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );*/
  }

  Widget buildInvalidResult() => Container(
    padding: EdgeInsets.all(20),
    child: Text(
      barcode != null ? 'Please provide a valid PlantB QR Code' : '',
      maxLines: 3,
      style: TextStyle(color: Colors.white),
    ),
  );

  bool isActivity() {
    return barcode != null && barcode!.code != null && code.startsWith("Activity_");
  }

  bool isFriend() {
    return barcode != null && barcode!.code != null && int.tryParse(code) != null && code.length == 8;
  }
}
