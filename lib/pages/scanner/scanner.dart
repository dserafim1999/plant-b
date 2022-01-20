import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_b/core/styles.dart';
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
            Positioned(child: buildResult(), bottom: 10)
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
    }));
  }

  Widget buildResult() => Container(
    padding: EdgeInsets.all(20),
    child: Text(
      barcode != null ? 'Result : ${barcode!.code}' : '',
      maxLines: 3,
      style: headline1,
    ),
  );
}
