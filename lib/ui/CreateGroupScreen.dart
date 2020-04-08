import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetrx/ui/ContactListScreen.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/text_styles.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
 // bool _autovalidate = false;

  TextEditingController groupNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
        //autovalidate: _autovalidate,
        child: Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0))),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text('Create Group',
                              style: TextStyles.blackBoldTextLabel),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: GestureDetector(
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: TextFormField(
                      controller: groupNameController,
                      style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                      maxLength: 20,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Group name',
                        counterStyle: TextStyle(fontSize: 0),
                        //labelText: 'Select country',
                        hintStyle: AppUtils.hintTextStyle(),
                        contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                      ),
                      validator: (String value){
                        if(value.isEmpty)
                          {
                            return 'Group Name must not be empty';
                          }
                        else{return null;}
                      },
                      onSaved: (String val){
                        groupNameController.text = val.trim();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: cityController,
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 20,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              counterText: '',
                              labelText: 'City',
                              counterStyle: TextStyle(fontSize: 0),
                              //labelText: 'Select country',
                              hintStyle: AppUtils.hintTextStyle(),
                              contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'City must not be empty';
                              }
                              else{return null;}
                            },
                            onSaved: (String val){
                              cityController.text = val.trim();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: stateController,
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 20,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              counterText: '',
                              labelText: 'State',
                              counterStyle: TextStyle(fontSize: 0),
                              //labelText: 'Select country',
                              hintStyle: AppUtils.hintTextStyle(),
                              contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'State must not be empty';
                              }
                              else{return null;}
                            },
                            onSaved: (String val){
                              stateController.text = val.trim();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: countryController,
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 20,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              counterText: '',
                              labelText: 'Country',
                              counterStyle: TextStyle(fontSize: 0),
                              //labelText: 'Select country',
                              hintStyle: AppUtils.hintTextStyle(),
                              contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'Country must not be empty';
                              }
                              else{return null;}
                            },
                            onSaved: (String val){
                              countryController.text = val.trim();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: pinCodeController,
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 20,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              counterText: '',
                              labelText: 'Pincode',
                              counterStyle: TextStyle(fontSize: 0),
                              //labelText: 'Select country',
                              hintStyle: AppUtils.hintTextStyle(),
                              contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                            ),
                            validator: (String value){
                              if(value.isEmpty)
                              {
                                return 'Pin must not be empty';
                              }
                              else{return null;}
                            },
                            onSaved: (String val){
                              pinCodeController.text = val.trim();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: TextFormField(
                      controller: addressController,
                      style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                      maxLength: 100,
                      maxLines: 4,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Address',
                        counterStyle: TextStyle(fontSize: 0),
                        //labelText: 'Select country',
                        hintStyle: AppUtils.hintTextStyle(),
                        contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                      ),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Address must not be empty';
                        }
                        else{return null;}
                      },
                      onSaved: (String val){
                        addressController.text = val.trim();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: TextFormField(
                      controller: keywordsController,
                      style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                      maxLength: 100,
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Keywords',
                        counterStyle: TextStyle(fontSize: 0),
                        //labelText: 'Select country',
                        hintStyle: AppUtils.hintTextStyle(),
                        contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                      ),
                      validator: (String value){
                        if(value.isEmpty)
                        {
                          return 'Keywords must not be empty';
                        }
                        else{return null;}
                      },
                      onSaved: (String val){
                        keywordsController.text = val.trim();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                    child: RaisedButton(
                      onPressed: () {
                        //TODO: Submit on pressed
                        if (_formkey.currentState.validate()){
                          _formkey.currentState.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactListScreen()));
                        }
                        /*else{
                          setState(() {
                            _autovalidate = true;
                          });
                        }*/
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactListScreen()));*/
                      },
                      color: Color(AppColors.colorPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Create Group',
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
            ))
    );
  }

}
