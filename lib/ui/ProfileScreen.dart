import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/sizes.dart';
import 'package:meetrx/utils/text_styles.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEdit = false;
  File _image;
  BuildContext _bottomSheetContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/images/meet_rx_icon.png',
              width: 25,
              height: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'My Profile',
              style: TextStyle(color: Colors.white, fontFamily: 'Muli'),
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              child: Icon(
                !isEdit ? Icons.edit : Icons.check,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  if (isEdit) {
                    isEdit = false;
                    Fluttertoast.showToast(msg: "Profile saved");
                  } else {
                    isEdit = true;
                  }
                });
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Container(
                width: 100,
                height: 100,
                child: Center(
                    child: Stack(
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 100,
                        child: ClipOval(
                          child: _image == null
                              ? CachedNetworkImage(
                                  imageUrl:
                                      "https://randomuser.me/api/portraits/men/75.jpg",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.person),
                                )
                              : Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                  height: 100,
                                  width: 100,
                                ),
                        )),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: ClipOval(
                          child: GestureDetector(
                        child: Container(
                          color: AppColors.primary,
                          width: 25,
                          height: 25,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        onTap: () {
                          _buildBottomSheet(context);
                        },
                      )),
                    )
                  ],
                ))),
            Padding(
              padding: Sizes.spacingTop10,
              child: Center(
                child: Text(
                  'Doctor xxxx',
                  style: TextStyles.labelStyle,
                ),
              ),
            ),
            Padding(
              padding: Sizes.spacingTop10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Age',
                          counterStyle: TextStyle(fontSize: 0),
                          //labelText: 'Select country',
                          hintStyle: AppUtils.hintTextStyle(),
                          contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Experiance',
                          counterStyle: TextStyle(fontSize: 0),
                          //labelText: 'Select country',
                          hintStyle: AppUtils.hintTextStyle(),
                          contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: Sizes.spacingTop10,
              child: IgnorePointer(
                ignoring: !isEdit,
                child: TextFormField(
                  style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                  maxLength: 3,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: 'Speciality',
                    counterStyle: TextStyle(fontSize: 0),
                    //labelText: 'Select country',
                    hintStyle: AppUtils.hintTextStyle(),
                    contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: Sizes.spacingTop10,
              child: IgnorePointer(
                ignoring: !isEdit,
                child: TextFormField(
                  style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                  maxLength: 3,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: 'Super Speciality',
                    counterStyle: TextStyle(fontSize: 0),
                    //labelText: 'Select country',
                    hintStyle: AppUtils.hintTextStyle(),
                    contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: Sizes.spacingTop10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Practice',
                          counterStyle: TextStyle(fontSize: 0),
                          //labelText: 'Select country',
                          hintStyle: AppUtils.hintTextStyle(),
                          contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Grade',
                          counterStyle: TextStyle(fontSize: 0),
                          //labelText: 'Select country',
                          hintStyle: AppUtils.hintTextStyle(),
                          contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: Sizes.spacingTop10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Hospital',
                          counterStyle: TextStyle(fontSize: 0),
                          //labelText: 'Select country',
                          hintStyle: AppUtils.hintTextStyle(),
                          contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Collage',
                          counterStyle: TextStyle(fontSize: 0),
                          //labelText: 'Select country',
                          hintStyle: AppUtils.hintTextStyle(),
                          contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: Sizes.spacingTop10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Language',
                          counterStyle: TextStyle(fontSize: 0),
                          //labelText: 'Select country',
                          hintStyle: AppUtils.hintTextStyle(),
                          contentPadding:
                              EdgeInsets.only(top: 15.0, bottom: 0.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
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
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: Sizes.spacingTop10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
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
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: IgnorePointer(
                      ignoring: !isEdit,
                      child: TextFormField(
                        style: TextStyle(fontFamily: 'Muli', fontSize: 11),
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
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
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _buildBottomSheet(BuildContext context) {
    _bottomSheetContext = context;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        isDismissible: false,
        context: context,
        builder: (BuildContext bc) {
          return Container(
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
                            child: Text('Pick image',
                                style: TextStyles.labelStyle),
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
                                Navigator.pop(_bottomSheetContext);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.camera),
                              iconSize: 50,
                              color: AppColors.primary,
                              onPressed: () {
                                getImageFile(ImageSource.camera);
                              },
                            ),
                            Center(
                              child: Text(
                                'Camera',
                                style: TextStyles.bottomNavigationBarTextLabel,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.photo),
                              iconSize: 50,
                              color: AppColors.primary,
                              onPressed: () {
                                getImageFile(ImageSource.gallery);
                              },
                            ),
                            Center(
                              child: Text(
                                'Gallery',
                                style: TextStyles.bottomNavigationBarTextLabel,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  getImageFile(ImageSource source) async {
    //Clicking or Picking from Gallery

    var image = await ImagePicker.pickImage(source: source);

    //Cropping the image

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
//      ratioX: 1.0,
//      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );

    //Compress the image

    setState(() {
      Navigator.pop(_bottomSheetContext);

      /*   _onLoading(context);
      Future<Response> future =
          UploadImage.upload(croppedFile, customerId, context);

      future.then((response) {
        setState(() {
          Fluttertoast.showToast(msg: response.data['message'].toString());
          sharedPreferences.setString(
              'profileImage', response.data['filePath'].toString());
          _image = croppedFile;
          Navigator.pop(_loadingContext);
        });
      });*/

      setState(() {
        _image = croppedFile;
      });
    });
  }
}
