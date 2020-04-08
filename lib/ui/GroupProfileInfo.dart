import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/sizes.dart';
import 'package:meetrx/utils/text_styles.dart';

class GroupProfileInfo extends StatefulWidget {
  @override
  _GroupProfileInfoState createState() => _GroupProfileInfoState();
}

class _GroupProfileInfoState extends State<GroupProfileInfo> {
  File _image;

  BuildContext _bottomSheetContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackground,
      appBar: AppBar(
        title: Text(
          'Group Info',
          style: TextStyle(fontFamily: 'Muli-Bold'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 180,
              child: Center(
                  child: Stack(
                children: <Widget>[
                  Container(
                      height: 180,
                      child: _image == null
                          ? CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  "https://picsum.photos/seed/picsum/200/300",
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
                              fit: BoxFit.cover,
                              height: 180,
                            )),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                          child: GestureDetector(
                        child: Container(
                          color: AppColors.primary,
                          width: 45,
                          height: 45,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        onTap: () {
                          _buildBottomSheet(context);
                        },
                      )),
                    ),
                  )
                ],
              ))),
          Container(
            color: Colors.white,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Created by Imran, 30/03/2020',
                  style: TextStyles.blackRegularTextLabel,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              color: Colors.white,
              height: 150,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildGroupMemberList(index);
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.group_add,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    'Add members',
                    style: TextStyles.blackRegularTextLabel,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.block,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Block memebers',
                    style: TextStyles.errorTextLabel,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              color: Colors.white,
              height: 50,
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Exit group',
                    style: TextStyles.errorTextLabel,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
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

  Widget _buildGroupMemberList(int index) {
    return Container(
        height: 40,
        child: ListTile(
            leading: Container(
              width: 30,
              height: 30,
              child: ClipOval(
                child: CachedNetworkImage(
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                  imageUrl: "https://randomuser.me/api/portraits/men/75.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.person),
                ),
              ),
            ),
            title: Text(
              () {
                if (index == 0) {
                  return 'Dr David';
                } else if (index == 1) {
                  return 'Dr Chris';
                } else if (index == 2) {
                  return 'Dr Elizabeth';
                } else {
                  return 'Dr Evan';
                }
              }(),
              style: TextStyles.blackRegularTextLabel,
            ),
            trailing: index == 0
                ? Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Admin',
                      style: TextStyles.minorTextLabel,
                    ),
                  )
                : null));
  }
}
