// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'ProductFactoryModel.dart';

Widget confirmationPopup(String? code, BuildContext context) {
  var factoryModel = Provider.of<ProductFactoryModel>(context, listen: true);
  print('Executed till here 1');

  // var uid = BigInt.parse(code!);

  // var result = factoryModel.getdetailsbyhash(uid);

  // print('Result after verify by hash' + result.toString());

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 300,
        height: 150,
        //padding: EdgeInsets.only(top: 50, bottom: 50),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Color(0xFFFFF7F7),
            elevation: 5,
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text('Product is Authentic',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF0D0D0D),
                        fontSize: 20,
                      )),
                ),
                Text('Would you like to purchase it?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xFF0D0D0D),
                      fontSize: 20,
                    )),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () async {
                        // create a condition where it will ask user first to verify wether product is orginal and then purchase it

                        var uid = BigInt.parse(code!);

                        print(
                            "Executed till here " + uid.runtimeType.toString());

                        var result = await factoryModel.sellProduct(uid);

                        print(result);
                      },
                      child: Text('Purchase',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF170303),
                          )),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(130, 30)),
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
                    TextButton(
                      onPressed: () async {},
                      child: Text('Discard',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF170303),
                          )),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(130, 30)),
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
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
