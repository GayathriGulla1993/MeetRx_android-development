import 'dart:collection';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/sizes.dart';
import 'package:meetrx/utils/text_styles.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<String> list = List();
  List<String> selectedContactList = List();
  List<Contact> listContact = List();

  @override
  void initState() {
    // TODO: implement initState

    Future<bool> isPermissionEnable = _checkPermission();

    isPermissionEnable.then((onValue) {
      if (onValue) {
        ContactsService.getContacts().then((foundContacts) {
          debugPrint("done loading contacts" + foundContacts.length.toString());
          final list = foundContacts.toList();
          list.sort((a, b) => a.givenName.compareTo(b.givenName));
          setState(() {
            listContact = list;
          });
        }).catchError((error) {
          debugPrint(error.toString());
        });
      }
    });

    super.initState();
  }

  Future<bool> _checkPermission() async {
    var status = await Permission.contacts.status;

    if (!status.isGranted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.contacts,
      ].request();
    }

    return status.isGranted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Create Group',
              style: TextStyle(fontFamily: 'Muli-Bold'),
            ),
            Text(
              'Add Participants',
              style: TextStyles.smallWhiteTextLabel,
            )
          ],
        ),
        actions: <Widget>[
          /*  Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton(
              onPressed: () {},
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                'Skip',
                style: TextStyle(
                    fontFamily: 'Muli', fontSize: 12, color: AppColors.primary),
              ),
            ),
          )*/
        ],
      ),
      body: Column(
        children: <Widget>[
          Visibility(
            visible: selectedContactList.length > 0,
            child: Container(
              height: 80,
              child: ListView.builder(
                  itemCount: selectedContactList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext builder, int index) {
                    return _buildSelectedContactItem(index);
                  }),
            ),
          ),
          Container(
            height: Sizes.screenHeight - Sizes.appBarHeight - 170,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listContact.length,
                itemBuilder: (BuildContext builder, int index) {
                  return _buildContactItem(index);
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          //TODO: we
          Fluttertoast.showToast(msg: "Member added");
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        mini: true,
      ),
    );
  }

  Widget _buildContactItem(int index) {
    return Container(
        child: Column(
      children: <Widget>[
        ListTile(
          leading: Container(
              width: 50,
              height: 50,
              child: Center(
                  child: Stack(
                children: <Widget>[
                  Container(
                      width: 50,
                      height: 50,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user_profile.png',
                          fit: BoxFit.fill,
                          height: 50,
                          width: 50,
                        ),
                      )),
                  Visibility(
                    visible: selectedContactList
                        .contains(listContact.elementAt(index).displayName),
                    child: Positioned(
                      bottom: 2,
                      right: 2,
                      child: ClipOval(
                          child: GestureDetector(
                        child: Container(
                          color: AppColors.green,
                          width: 15,
                          height: 15,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                        onTap: () {},
                      )),
                    ),
                  )
                ],
              ))),
          title: Text(
            listContact.elementAt(index).displayName,
            style: TextStyles.drawerItemTextLabel,
          ),
          onTap: () {
            if (selectedContactList.length < 1) {
              setState(() {
                selectedContactList
                    .add(listContact.elementAt(index).displayName);
              });
            } else if (!(selectedContactList
                .contains(listContact.elementAt(index).displayName))) {
              setState(() {
                selectedContactList
                    .add(listContact.elementAt(index).displayName);
              });
            } else {
              setState(() {
                selectedContactList
                    .remove(listContact.elementAt(index).displayName);
              });
            }
          },
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
        )
      ],
    ));
  }

  Widget _buildSelectedContactItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 50,
              height: 50,
              child: Center(
                  child: Stack(
                children: <Widget>[
                  Container(
                      width: 50,
                      height: 50,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/user_profile.png',
                          fit: BoxFit.fill,
                          height: 50,
                          width: 50,
                        ),
                      )),
                  Visibility(
                    visible: true,
                    child: Positioned(
                      bottom: 2,
                      right: 2,
                      child: ClipOval(
                          child: GestureDetector(
                        child: Container(
                          color: Colors.black54,
                          width: 15,
                          height: 15,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedContactList
                                .remove(selectedContactList[index]);
                          });
                        },
                      )),
                    ),
                  )
                ],
              ))),
          Text(
            selectedContactList[index],
            style: TextStyles.smallGreyTextLabel,
          ),
        ],
      ),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            contentPadding: EdgeInsets.only(top: 0.0),
            content: Container(
              width: Sizes.screenWidth / 2,
              height: Sizes.screenHeight / 2,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0)),
                        color: AppColors.primary),
                    child: Center(
                        child: Text(
                      'Group creation',
                      style: TextStyles.drawerHeaderUserNameTextLabel,
                    )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: TextFormField(
                      style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                      maxLength: 3,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        counterText: '',
                        labelText: 'GroupName',
                        counterStyle: TextStyle(fontSize: 0),
                        //labelText: 'Select country',
                        hintStyle: AppUtils.hintTextStyle(),
                        contentPadding: EdgeInsets.only(top: 15.0, bottom: 0.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 3,
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
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 3,
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
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 3,
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
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            style: TextStyle(fontFamily: 'Muli', fontSize: 10),
                            maxLength: 3,
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
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: TextFormField(
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
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 5, right: 20),
                    child: TextFormField(
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
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                    child: RaisedButton(
                      onPressed: () {
                        //TODO: Submit on pressed
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
            ),
          );
        });
  }
}
