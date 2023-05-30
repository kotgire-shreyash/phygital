import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phygital/addProductPage.dart';
import 'package:provider/provider.dart';
import 'models/webLoginPageModel.dart';

class WebLoginPageWidget extends StatefulWidget {
  const WebLoginPageWidget({Key? key}) : super(key: key);

  @override
  _WebLoginPageWidgetState createState() => _WebLoginPageWidgetState();
}

class _WebLoginPageWidgetState extends State<WebLoginPageWidget> {
  late WebLoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = WebLoginPageModel();

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF241A1D),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'images/loginbackground.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(50, 50, 0, 0),
                          child: Container(
                            width: 200,
                            height: 100,
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            alignment: AlignmentDirectional(0, 0),
                            child: Text('Phygital',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFFFFEFE),
                                  fontSize: 37,
                                )),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(color: Colors.transparent),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 800,
                          height: 400,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      width: 100,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(15),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0xFF00E3A5),
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 20),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Wallet Address',
                                                  labelStyle: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFF00E3A5),
                                                    fontSize: 20,
                                                  ),
                                                  hintStyle: TextStyle(),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0x8A6FB9A5),
                                                ),
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white70),

                                                // validator: _model
                                                //     .textController1Validator!
                                                //     .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 0, 8, 20),
                                              child: TextFormField(
                                                  controller:
                                                      _model.textController2,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Secret Key or Private Key',
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF00E3A5),
                                                      fontSize: 20,
                                                    ),
                                                    hintStyle: TextStyle(),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.blueAccent,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        Color(0x8A6FB9A5),
                                                  ),
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.white70)

                                                  // validator: _model
                                                  //     .textController2Validator
                                                  //     .asValidator(context),
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 20, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Forgot Password?',
                                                    style: TextStyle(
                                                      fontFamily: 'Italiana',
                                                      color: Color(0xFF00E3A5),
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'images/usericon.png',
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Text('Welcome',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white70,
                                              fontSize: 20,
                                            )),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 10,
                            child: Container(
                                width: 200,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0xFF00E3A5),
                                      offset: Offset(0, 4),
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    if (_model.textController1!.text == '' &&
                                        _model.textController2!.text ==
                                            'a1ca03033d27d16ec09651db73308d6ca2c52295df7c2f9868d2f3de25f16a20') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddProductPageWidget(),
                                        ),
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Please Enter Valid Credentials",
                                          gravity: ToastGravity.BOTTOM,
                                          fontSize: 20);
                                    }
                                  },
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                        Size(200, 40)),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0)),
                                    backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF00E3A5),
                                    ),
                                    elevation: MaterialStateProperty.all(10),
                                    side: MaterialStateProperty.all(
                                      BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                )),
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
      ),
    );
  }
}
