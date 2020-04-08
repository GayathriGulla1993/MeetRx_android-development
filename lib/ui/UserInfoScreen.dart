import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meetrx/ui/EventDashboard.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String gender;
  String dob;

  var _userFormKey = GlobalKey<FormState>();

//controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController experianceController = TextEditingController();
  TextEditingController hospitalController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController specialityController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var formattedDate =
            "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
        _date.value = TextEditingValue(text: formattedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/images/meet_rx_icon.png',
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'MeetRx',
              style: TextStyle(color: Colors.white, fontFamily: 'Muli'),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _userFormKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                controller: nameController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Name';
                  }
                },
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Name',
                  contentPadding: EdgeInsets.only(top: 20.0, bottom: 0.0),
                ),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                controller: emailController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Email';
                  }
                },
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Email',
                  contentPadding: EdgeInsets.only(top: 20.0, bottom: 0.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Sex",
                            style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                          ),
                        ),
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),

                        /* onChanged: (String newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },*/
                        items:
                            <String>['Male', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                value,
                                style:
                                    TextStyle(fontFamily: 'Muli', fontSize: 13),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String value) {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: _date,
                            //controller: experianceController,
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Please select Date of birth';
                              }
                            },
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: 'Date of Birth',
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Date of Birth",
                            style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                          ),
                        ),
                        isExpanded: true,
                        //icon: Icon(Icons.keyboard_arrow_down),
                        */ /* onChanged: (String newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },*/ /*
                        items:
                        <String>['Male', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                value,
                                style:
                                TextStyle(fontFamily: 'Muli', fontSize: 13),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String value) {},
                      ),*/
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Country",
                            style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                          ),
                        ),
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),

                        /* onChanged: (String newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },*/
                        items:
                            <String>['Male', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                value,
                                style:
                                    TextStyle(fontFamily: 'Muli', fontSize: 13),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String value) {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "State",
                            style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                          ),
                        ),
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        /* onChanged: (String newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },*/
                        items:
                            <String>['Male', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                value,
                                style:
                                    TextStyle(fontFamily: 'Muli', fontSize: 13),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String value) {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        hint: Text(
                          "City",
                          style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                        ),
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),

                        /* onChanged: (String newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },*/
                        items:
                            <String>['Male', 'B', 'C', 'D'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                            ),
                          );
                        }).toList(),
                        onChanged: (String value) {},
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: TextFormField(
                            style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                            controller: pinCodeController,
                            validator: (String value){
                              if(value.isEmpty){
                                return 'Please enter PINCODE';
                              }
                            },
                            maxLength: 10,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              counterText: '',
                              counterStyle: TextStyle(fontSize: 0),
                              //labelText: 'Select country',
                              hintStyle: AppUtils.hintTextStyle(),
                              hintText: 'Pin Code',
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Address (optional)',
                ),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                controller: designationController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Designation';
                  }
                },
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Designation',
                ),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                controller: experianceController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Experiance';
                  }
                },
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Experience',
                ),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                controller: hospitalController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Hospital Name';
                  }
                },
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Hospital',
                ),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                controller: gradeController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Grade';
                  }
                },
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Grade',
                ),
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Muli', fontSize: 13),
                controller: specialityController,
                validator: (String value){
                  if(value.isEmpty){
                    return 'Please enter Specialization';
                  }
                },
                maxLength: 10,
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  counterText: '',
                  counterStyle: TextStyle(fontSize: 0),
                  //labelText: 'Select country',
                  hintStyle: AppUtils.hintTextStyle(),
                  hintText: 'Speciality',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                child: RaisedButton(
                  onPressed: () {
                    if(_userFormKey.currentState.validate()){
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => EventDashboardScreen()));
                    }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
