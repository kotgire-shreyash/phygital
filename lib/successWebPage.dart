import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phygital/manufactuer_homepage.dart';
import 'package:provider/provider.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class SuccessWebPageWidget extends StatefulWidget {
  const SuccessWebPageWidget({Key? key, required this.upiDetails})
      : super(key: key);

  final UPIDetails upiDetails;

  @override
  _SuccessWebPageWidgetState createState() => _SuccessWebPageWidgetState();
}

class _SuccessWebPageWidgetState extends State<SuccessWebPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF170303),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'images/successpagebackground.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text('Phygital',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white70,
                                fontSize: 30,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('Product Added Successfully!!!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white70,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ManufacturerHomepage()));
                          },
                          child: Text(
                            'Back To Homepage',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF170303),
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(350, 50)),
                            padding: MaterialStateProperty.all(
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF00E3A5)),
                            elevation: MaterialStatePropertyAll(3),
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
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: Image.asset(
                        //     'images/shield_img.png',
                        //   ).image,
                        // ),
                      ),
                      child: UPIPaymentQRCode(upiDetails: widget.upiDetails),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
