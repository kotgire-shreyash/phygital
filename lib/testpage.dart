import 'package:flutter/material.dart';
import 'package:phygital/ProductFactoryModel.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _nameTextEditingController = TextEditingController();
  final _metadataTextEditingController = TextEditingController();
  String? code;

  @override
  Widget build(BuildContext context) {
    final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
    return Scaffold(
      appBar: AppBar(
        title: Text("Phygital"),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            controller: _nameTextEditingController,
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: _metadataTextEditingController,
          ),
          SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () async {
                // listModel.addProduct(_nameTextEditingController.text,
                //     _metadataTextEditingController.text);
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Data'),
                  ),
                  barrierDismissible: false,
                );

                // _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                //     context: context,
                //     onCode: (code) {
                //       setState(() {
                //         this.code = code;
                //       });
                //     });
              },
              child: Text(code ?? 'submit'))
        ],
      ),
    );
  }
}
