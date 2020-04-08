import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetrx/ui/UserInfoScreen.dart';
import 'package:meetrx/utils/AppString.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:pin_view/pin_view.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(AppColors.colorPrimary),
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                  /*Text(
                          'Back',
                          style: TextStyle(
                              fontFamily: 'Muli',
                              fontSize: 14,
                              color: Color(AppColors.colorPrimary)),
                        )*/
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        AppString.otpVerification,
                        style: TextStyle(
                            fontFamily: 'Muli',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                            color: Colors.grey[900]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0, left: 20, right: 20),
                      child: Text(
                        AppString.enterOtpReceived,
                        style: AppUtils.textStyle(
                            Colors.grey[800], 10, FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Text(
                        '+91 12345 XXXXX',
                        style: AppUtils.textStyle(
                            Colors.grey[800], 12, FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 40),
                      child: PinView(
                          autoFocusFirstField: false,
                          style: TextStyle(
                              fontFamily: 'Muli',
                              color: Color(AppColors.colorPrimary)),
                          inputDecoration: InputDecoration(
                            counterText: '',
                            fillColor: Color(0xFFEBF3F9),
                            filled: true,
                            border: InputBorder.none,
                            counterStyle: TextStyle(fontSize: 0),
                            contentPadding:
                                EdgeInsets.only(top: 5.0, bottom: 0.0),
                          ),
                          margin:
                              EdgeInsetsDirectional.only(start: 10, end: 10),
                          count: 4, // count of the fields, excluding dashes
                          // describes the dash positions (not indexes)
                          sms: SmsListener(
                              // this class is used to receive, format and process an sms
                              from: "6505551212",
                              formatBody: (String body) {
                                // incoming message type
                                // from: "6505551212"
                                // body: "Your verification code is: 123-456"
                                // with this function, we format body to only contain
                                // the pin itself
                                String codeRaw = body.split(": ")[1];
                                List<String> code = codeRaw.split("-");
                                return code.join();
                              }),
                          submit: (String pin) {
                            Fluttertoast.showToast(msg: pin);
                          } // gets triggered when all the fields are filled
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_back,
                                  color: Color(AppColors.colorPrimary),
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'BACK',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(AppColors.colorPrimary)),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'RESEND OTP',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color(AppColors.colorPrimary)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.replay,
                                  color: Color(AppColors.colorPrimary),
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => UserInfoScreen()));
                        },
                        color: Color(AppColors.colorPrimary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 15,
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
