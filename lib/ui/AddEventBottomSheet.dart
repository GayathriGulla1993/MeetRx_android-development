import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/text_styles.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEventBottomSheet extends StatefulWidget {
  @override
  _AddEventBottomSheetState createState() => _AddEventBottomSheetState();
}

class _AddEventBottomSheetState extends State<AddEventBottomSheet> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //bool _autovalidate = false;
  TextEditingController _title = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  TextEditingController _location = new TextEditingController();
  var selectedYear;
  bool isValueFromDatePicker = false;
  String dob = "";
  TextEditingController _dobController = new TextEditingController();
  TextEditingController _timeController = new TextEditingController();

  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  Widget buildGridView() {
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            Asset asset = images[index];
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: 100,
                child: Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.center,
                        child: AssetThumb(
                          quality: 100,
                          asset: asset,
                          width: 100,
                          height: 100,
                        )),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0, right: 5),
                          child: ClipOval(
                            child: Container(
                              color: Colors.red,
                              child: GestureDetector(
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                onTap: () {
                                  setState(() {
                                    images.removeAt(index);
                                  });
                                },
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarTitle: 'Pick Images',
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text('Create Event',
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
                      controller: _title,
                      style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                      maxLength: 3,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Title',
                        counterStyle: TextStyle(fontSize: 0),
                        //labelText: 'Select country',
                        hintStyle: AppUtils.hintTextStyle(),
                        contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                      ),
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Title must not be empty';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (String val){
                        _title.text = val.trim();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: TextFormField(
                      controller: _description,
                      style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                      maxLength: 3,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Discription',
                        counterStyle: TextStyle(fontSize: 0),
                        //labelText: 'Select country',
                        hintStyle: AppUtils.hintTextStyle(),
                        contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                      ),
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Description must not be empty';
                        }
                        else{return null;}
                      },
                      onSaved: (String val){
                        _description.text = val.trim();
                      },

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: TextFormField(
                      controller: _location,
                      style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                      maxLength: 3,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Location',
                        counterStyle: TextStyle(fontSize: 0),
                        //labelText: 'Select country',
                        hintStyle: AppUtils.hintTextStyle(),
                        contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                      ),
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Location must not be empty';
                        }
                        else{return null;}
                      },
                      onSaved: (String val){
                        _location.text = val.trim();
                      },

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showPicker();
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: _dobController,
                                style: TextStyle(
                                    fontSize: 10, fontFamily: 'montserrat'),
                                decoration: InputDecoration(
                                  labelText: 'Date',
                                  labelStyle: TextStyle(
                                      fontSize: 10, fontFamily: 'montserrat'),
                                  contentPadding:
                                  EdgeInsets.only(bottom: 3, top: 10),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.date_range,
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        debugPrint('222');
                                      }),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Select date of birth';
                                  } else
                                    return null;
                                },
                                onSaved: (String val){
                                  _dobController.text = val.trim();
                                },

                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showTimePicker();
                            },
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: _timeController,
                                style: TextStyle(
                                    fontSize: 10, fontFamily: 'montserrat'),
                                decoration: InputDecoration(
                                  labelText: 'Time',
                                  labelStyle: TextStyle(
                                      fontSize: 10, fontFamily: 'montserrat'),
                                  contentPadding:
                                  EdgeInsets.only(bottom: 3, top: 10),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        Icons.access_time,
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        debugPrint('222');
                                      }),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Select Time';
                                  } else
                                    return null;
                                },
                                onSaved: (String val){
                                  _timeController.text = val.trim();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: images.length < 1
                        ? Container(
                      height: 150,
                      color: AppColors.lightPrimary,
                      child: GestureDetector(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.cloud_upload,
                              color: AppColors.primary,
                            ),
                            Text(
                              '  Upload Photos/Videos',
                              style: TextStyles.smallTextPrimaryColorLabel,
                            )
                          ],
                        ),
                        onTap: loadAssets,
                      ),
                    )
                        : buildGridView(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: RaisedButton(
                      onPressed: () {
                        _validateinput();
                        //TODO: Submit on pressed
                      },
                      color: Color(AppColors.colorPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Create Event',
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

  void _validateinput(){
    if (_formkey.currentState.validate()){
      _formkey.currentState.save();
      Fluttertoast.showToast(msg: "validated");
    }
  }


  void _showPicker() {
    showDatePicker(
            context: context,
            firstDate: new DateTime(1900),
            initialDate: new DateTime(2018),
            lastDate: DateTime.now())
        .then((DateTime dt) {
      selectedYear = dt.year;

      setState(() {
        isValueFromDatePicker = true;
        selectedYear = dt.toIso8601String();
        dob = _formatDate(dt);
        _dobController.text = dob;
      });
    });
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    ).then((TimeOfDay dt) {
      // selectedYear = dt;

      setState(() {
        isValueFromDatePicker = true;
        //selectedYear = dt.format(context);
        dob = dt.format(context);
        _timeController.text = dob;
      });
    });
  }

  String _formatDate(DateTime dt) {
    var formatter = new DateFormat('dd-MMM-yyyy');
    return formatter.format(dt);
  }
}
