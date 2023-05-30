// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:phygital/ProductFactoryModel.dart';
import 'package:phygital/addProductPage.dart';
import 'package:phygital/webLoginPage.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
import 'package:phygital/models/flutterflowmodel.dart';

class ManufacturerHomepage extends StatefulWidget {
  const ManufacturerHomepage({super.key});

  @override
  State<ManufacturerHomepage> createState() => _ManufacturerHomepageState();
}

class _ManufacturerHomepageState extends State<ManufacturerHomepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF241A1D),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'images/image.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Phygital',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFFEFE),
                                fontSize: 45,
                              )),
                          Container(
                            width: 150,
                            height: 100,
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                          ),
                          Text('About Us',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFFEFE),
                                fontSize: 19,
                              )),
                          Text('Services',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFFEFE),
                                fontSize: 19,
                              )),
                          Text('How it Works',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFFEFE),
                                fontSize: 19,
                              )),
                          Text('Help',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFFEFE),
                                fontSize: 19,
                              )),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Join For Free',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 19,
                              ),
                            ),
                            style: ButtonStyle(
                              fixedSize:
                                  MaterialStateProperty.all(Size(200, 70)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF170303)),
                              side: MaterialStateProperty.all(
                                BorderSide(
                                    color: Color(0xFF00E3A5),
                                    width: 2,
                                    style: BorderStyle.solid),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 450,
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Product’s Digital Identity with ',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF80AB9E),
                                        fontSize: 19,
                                      )),
                                  Text(
                                    'Blockchain Technology',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFFFEFE),
                                      fontSize: 50,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WebLoginPageWidget()
                                                //AddProductPageWidget(),
                                                ),
                                          );
//  await Navigator.push(
//                                             context,
//                                             PageTransition(
//                                               type: PageTransitionType
//                                                   .bottomToTop,
//                                               duration:
//                                                   Duration(milliseconds: 10),
//                                               reverseDuration:
//                                                   Duration(milliseconds: 10),
//                                               child: AddProductPageWidget(),
//                                             ),
//                                           );
                                        },
                                        child: Text(
                                          'Manufacturer Login',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF241A1D),
                                            fontSize: 20,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size(225, 65)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF00E3A5)),
                                          side: MaterialStateProperty.all(
                                            BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent),
                                      ),
                                      TextButton(
                                        onPressed: () async {},
                                        child: Text(
                                          'Customer Login',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF241A1D),
                                            fontSize: 20,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              Size(225, 65)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0)),
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF00E3A5)),
                                          side: MaterialStateProperty.all(
                                            BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 750,
                          height: 450,
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
                      ],
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
