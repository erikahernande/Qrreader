import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreader/providers/scan_list_provider.dart';
import 'package:qrreader/utils/utils.dart';

import '../providers/scan_list_provider.dart';
import '../providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          //    final barcodeScanRes = 'geo:45.280089,-75.922405';

          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D88EF', 'Cancelar', false, ScanMode.QR);

          if (barcodeScanRes == '-1') {
            return;
          }

          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

          launchURL(nuevoScan, context);
        },
        child: Icon(Icons.filter_center_focus));
  }
}
