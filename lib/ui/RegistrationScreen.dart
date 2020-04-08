import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetrx/bloc/meetrx_bloc.dart';
import 'package:meetrx/ui/OtpScreen.dart';
import 'package:meetrx/utils/AppString.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String mobileNumberValue;

  @override
  Widget build(BuildContext context) {
    final bloc = MeetRxBlock();
    return Scaffold(
        /*  appBar: AppBar(
        title: Text(
          'Mobile verification',
          style: TextStyle(fontFamily: 'Muli'),
        ),
      ),*/
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SafeArea(
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
                    child: Column(
                      children: <Widget>[
                        ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: 90,
                              height: 60,
                              child: Image.asset('assets/images/logo.png'),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Text(
                                AppString.verifyYourPhoneNumber,
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.0,
                                    color: Colors.grey[600]),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: GestureDetector(
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      readOnly: true,
                                      style: TextStyle(
                                          fontFamily: 'Muli', fontSize: 12),
                                      maxLength: 18,
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        counterStyle: TextStyle(fontSize: 0),
                                        hintText: 'Select country',
                                        contentPadding: EdgeInsets.only(
                                            top: 5.0, bottom: 0.0),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: "Select your country");
                                  },
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontFamily: 'Muli', fontSize: 12),
                                      maxLength: 4,
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        counterStyle: TextStyle(fontSize: 0),
                                        //labelText: 'Select country',
                                        hintText: '+91',
                                        contentPadding: EdgeInsets.only(
                                            top: 5.0, bottom: 0.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: StreamBuilder(
                                        stream: bloc.mobileNumber,
                                        builder: (context, snapshot) =>
                                            TextFormField(
                                          onChanged: ((value) {
                                            bloc.mobileNumberChanged.add(value);
                                            mobileNumberValue = value;
                                          }),
                                          decoration: InputDecoration(
                                            counterText: '',
                                            counterStyle: TextStyle(
                                                fontSize: 0,
                                                fontFamily: 'Muli'),
                                            labelText: 'Enter mobile number',
                                            errorText: snapshot.error,
                                            labelStyle: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Muli'),
                                            contentPadding: EdgeInsets.only(
                                                top: 5.0, bottom: 0.0),
                                          ),
                                          maxLength: 10,
                                          maxLines: 1,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ))
                                  /* Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontFamily: 'Muli', fontSize: 12),
                                      maxLength: 10,
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        counterStyle: TextStyle(fontSize: 0),
                                        //labelText: 'Select country',
                                        hintText: 'Enter Number',
                                        contentPadding: EdgeInsets.only(
                                            top: 5.0, bottom: 0.0),
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                AppString.otpWillSentViaSMS,
                                style: AppUtils.textStyle(
                                    Colors.grey[600], 12, FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => OtpScreen()));

                                  /* Future<LoginResponse> loginResponse =
                              bloc.login( "userId",  mobileNumberValue,
                                   "countryId",  "requestType",  "numberChange");
                          loginResponse.then((onValue) {
                            Fluttertoast.showToast(msg: onValue.message);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => OtpScreen()));
                          });*/
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
                      ],
                    )),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
