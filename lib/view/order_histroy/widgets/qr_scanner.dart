import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/arrow_back_icons.dart';

class QrScan extends StatefulWidget {
   QrScan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final ScreenUtil screenUtil = ScreenUtil();

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
        centerTitle: true,
        title: const Text('Team Check'),
        leading: ArrowBackIcon(ontap: (){Get.back();}),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded( child: _buildQrView(context)),
          Container(height: screenUtil.setHeight(48),decoration: BoxDecoration(color: Color.fromRGBO(179, 179, 179, 1),borderRadius: BorderRadius.circular(10),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (result != null)
                Text(
                    ' Accepted: ${result!.code}',style: TextStyle(fontSize: 18),)
              else
                const Text('Scan a code'),

            ],
          ) ,
          ),
          50.ph,
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}