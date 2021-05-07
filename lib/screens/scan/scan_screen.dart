import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heritage/routes/app_routes.dart';
import 'package:heritage/shared/app_gradient_text.dart';
import 'package:heritage/utilities/app_data.dart';
import 'package:heritage/utilities/app_ui.dart';

class ScanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'Heritage',
              child: AppGradientText(
                'Heritage',
                fontSize: 64,
                fontFamilly: AppUi.italianaFont,
              ),
            ),
            Spacer(),
            Text(
              'Scan the QR code to get information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'قم بمسح رمز ال QR للحصول على المعلومات',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    '#e6d07a', 'Cancel', true, ScanMode.QR);

                if (barcodeScanRes != null) {
                  var index = int.tryParse(barcodeScanRes);
                  if (index <= 3 && index > 0)
                    Navigator.pushNamed(
                      context,
                      AppRoutes.DETAILS,
                    
                      arguments: AppData.antiques[index - 1],
                    );
                }
              },
              child: ShaderMask(
                shaderCallback: (bounds) {
                  return AppUi.yellowGradent.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  );
                },
                child: SvgPicture.asset(
                  'assets/images/iconmonstr-qr-code-3.svg',
                  semanticsLabel: 'QR code',
                  color: AppUi.whiteColor,
                  width: 128,
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
