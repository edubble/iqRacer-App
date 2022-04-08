import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:iq_racer/src/controllers/question_controller.dart';
import 'package:iq_racer/src/models/global.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:http/http.dart' as http;

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<QRScreen> {
  String _scanBarcode = 'Unknown';

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String data = "${currentUser.id}";

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/${currentUser.userImage}"),
                    backgroundColor: const Color(0xFFF5F6F9),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              currentUser.userName,
            ),
            QrImage(
              data: data,
              size: MediaQuery.of(context).size.height * 0.4,
            ),
            _scanQrButton(
              context,
              "Escanear",
            )
          ],
        ),
      ),
    );
  }

  _scanQrButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: scanQR,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF5591F),
              gradient: const LinearGradient(
                colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          )),
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#F2861E', 'Cancelar', true, ScanMode.QR);

      // Insert relationship
      int idUserScanned = int.parse(barcodeScanRes);
      var statusCode = await createRelationShip(idUserScanned);

      print("QR code ${idUserScanned}");
      print("User current code ${currentUser.id}");

      if (statusCode == 200) {
        showDoneSnackBar(
            context, 0xFF008000, "Contacto agregado correctamente.");
      } else {
        showDoneSnackBar(context, 0xFFcc0000, "Error al agregar contacto.");
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      print(_scanBarcode);
    });
  }
}

Future createRelationShip(idUser) async {
  var url = "http://rogercr2001-001-site1.itempurl.com/api/relationships";

  Map data = {
    "id_user_send": currentUser.id,
    "id_user_received": idUser,
  };

  var body = json.encode(data);
  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);
  var statusCode = response.statusCode;

  return statusCode;
}
