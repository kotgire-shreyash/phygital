// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:phygital/ProductFactoryModel.dart';
import 'package:phygital/successWebPage.dart';
import 'package:provider/provider.dart';
import 'models/addProductPageModel.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

// import 'add_product_page_model.dart';
// export 'add_product_page_model.dart';

class AddProductPageWidget extends StatefulWidget {
  const AddProductPageWidget({Key? key}) : super(key: key);

  @override
  _AddProductPageWidgetState createState() => _AddProductPageWidgetState();
}

class _AddProductPageWidgetState extends State<AddProductPageWidget> {
  late AddProductPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = AddProductPageModel();

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var factoryModel = Provider.of<ProductFactoryModel>(context, listen: true);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF170303),
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-0.12, -0.14),
                child: Image.asset(
                  'images/image.png',
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                            child: Text(
                              ' ',
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 600,
                          height: 500,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add Product Details',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFFFEFE),
                                    fontSize: 50,
                                  )),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text('Name of The Product',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF00E3A5),
                                      fontSize: 27,
                                    )),
                              ),
                              Container(
                                width: 500,
                                height: 40,
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: TextFormField(
                                  controller: _model.textController1,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFFFEFE),
                                      fontSize: 18,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF00E3A5),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFFFEFE),
                                  ),

                                  // validator: _model.textController1Validator
                                  //     .asValidator(context),
                                ),
                              ),
                              Text('Metadata of The Product',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF00E3A5),
                                    fontSize: 27,
                                  )),
                              Container(
                                width: 500,
                                height: 40,
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: TextFormField(
                                    controller: _model.textController2,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFFFEFE),
                                        fontSize: 18,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFF00E3A5),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFFFEFE),
                                    )

                                    // validator: _model.textController2Validator
                                    //     .asValidator(context),
                                    ),
                              ),
                              Text('Description',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF00E3A5),
                                    fontSize: 27,
                                  )),
                              Container(
                                width: 500,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: TextFormField(
                                  controller: _model.textController3,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFFFFEFE),
                                      fontSize: 18,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF00E3A5),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFFFEFE),
                                  ),

                                  // validator: _model.textController3Validator
                                  //     .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 618.7,
                          height: 487.2,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Lottie.network(
                            'https://assets9.lottiefiles.com/packages/lf20_3qbmscbe.json',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            //function after submission of details

                            var result = await factoryModel.addProduct(
                                _model.textController1!.text,
                                _model.textController2!.text);

                            print("Result after product addition" +
                                result.toString());

                            final upidetails = UPIDetails(
                                upiID: result[0].toString(),
                                payeeName: result[1].toString());

                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuccessWebPageWidget(
                                    upiDetails: upidetails
                                    // UPIDetails(
                                    //     upiID: "abcd", payeeName: "abcd"),
                                    ),
                              ),
                            );
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(300, 50)),
                            padding: MaterialStateProperty.all(
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xFF00E3A5),
                            ),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                            ),
                          ),
                        )
                      ],
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
