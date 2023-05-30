// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phygital/confirmationPopup.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class MobileHomePageWidget extends StatefulWidget {
  const MobileHomePageWidget({Key? key}) : super(key: key);

  @override
  _MobileHomePageWidgetState createState() => _MobileHomePageWidgetState();
}

class _MobileHomePageWidgetState extends State<MobileHomePageWidget> {
  // late MobileHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? code;

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => MobileHomePageModel());
  }

  @override
  void dispose() {
    // _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF0D0D0D),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/mobileBackground.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 30, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                        icon: Icon(
                          Icons.filter_list_outlined,
                          color: Color(0xFF00E3A5),
                          size: 35,
                        ),
                        iconSize: 60,
                      ),
                      // FlutterFlowIconButton(
                      //   borderColor: Colors.transparent,
                      //   borderRadius: 30,
                      //   borderWidth: 1,
                      //   buttonSize: 60,
                      // ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Text('Phygital',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFFFEFE),
                              fontSize: 28,
                            )),
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'images/usericon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 60, 15, 0),
                  child: Text('Product’s Digital Identity with ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF80AB9E),
                        fontSize: 24,
                      )),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text('Blockchain Technology',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFFFF7F7),
                        fontSize: 40,
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Container(
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'images/homepage-blockchain.png',
                        ).image,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                              context: context,
                              onCode: (code) {
                                var buffer =
                                    code!.split('pa=')[1].split('&pn=');
                                var name = buffer[0];
                                var id = buffer[1].split('&tr')[0];

                                print("code to be redeemed" + name);

                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        confirmationPopup(id, context));
                              });

                          // var buffer = code!.split('pa=')[1].split('&pn=');
                          // var id = buffer[0];
                          // var name = buffer[1].split('&tr')[0];
                        },
                        child: Text('Scan QR',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF170303),
                            )),
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(160, 50)),
                          padding: MaterialStateProperty.all(
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF00E3A5)),
                          side: MaterialStateProperty.all(
                            BorderSide(
                                color: Colors.transparent,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
