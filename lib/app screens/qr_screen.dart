import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mtech_attendance/utils/config.dart';
import 'package:mtech_attendance/utils/dynamic_sizes.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Widgets/text_widget.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({Key? key}) : super(key: key);

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final qrKey = GlobalKey();

  QRViewController? controller;

  void qrCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((event) async {
      await checkQr(event.code.toString());
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
    super.reassemble();
  }

  checkQr(tableCode) async {
    await controller!.pauseCamera();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => QRInfo(
    //       qrApi: tableCode,
    //     ),
    //   ),
    // ).then((value) => controller!.resumeCamera());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: qrCreated,
              overlay: QrScannerOverlayShape(
                borderColor: AppColors.customBlue,
                borderLength: 20,
                borderRadius: 10,
                borderWidth: 10,
                cutOutSize: CustomSizes().dynamicWidth(context, 0.8),
              ),
            ),
            bottomText(),
            toggleIcons()
          ],
        ),
      ),
    );
  }

  Widget bottomText() {
    return Positioned(
      bottom: CustomSizes().dynamicHeight(context, 0.1),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(CustomSizes().dynamicWidth(context, 0.02)),
        child: Container(
          color: AppColors.customWhite.withOpacity(0.4),
          padding: EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.02)),
          child: text(context, "Scan the QR code", 0.04, AppColors.customWhite),
        ),
      ),
    );
  }

  Widget toggleIcons() {
    return Positioned(
      top: CustomSizes().dynamicHeight(context, 0.02),
      child: SizedBox(
        width: CustomSizes().dynamicWidth(context, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.all(CustomSizes().dynamicWidth(context, 0.01)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    CustomSizes().dynamicWidth(context, 0.1)),
                color: Colors.white24,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    icon: FutureBuilder<bool?>(
                      future: controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Icon(
                            snapshot.data! ? Icons.flash_on : Icons.flash_off,
                            color: AppColors.customWhite,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await controller?.flipCamera();
                      setState(() {});
                    },
                    icon: FutureBuilder(
                      future: controller?.getCameraInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return const Icon(
                            Icons.switch_camera,
                            color: AppColors.customWhite,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
