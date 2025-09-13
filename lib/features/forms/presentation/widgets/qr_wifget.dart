import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QrCode extends StatefulWidget {
  const QrCode({
    super.key,
    required this.formId,
  });
  final String formId;
  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () async {
              await captureAndSaveQRCode();
              Navigator.of(context).pop();
            },
            child: const Text("capture qr code")),
        Center(
            child: Screenshot(
                controller: _screenshotController, child: _buildQRImage())),
      ],
    );
  }

  Widget _buildQRImage() {
    return QrImage(
      data: widget.formId,
      size: 250.0,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.H,
      gapless: false,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  Future<void> captureAndSaveQRCode() async {
    await [Permission.storage].request();
    final image =
        await _screenshotController.captureFromWidget(_buildQRImage());
    await ImageGallerySaver.saveImage(image,
        name:
            'Snapshot${DateTime.now().toIso8601String().replaceAll('.', '-').replaceAll(':', '-')}');
  }
}
