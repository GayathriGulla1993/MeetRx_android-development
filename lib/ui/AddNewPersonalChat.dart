import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/sizes.dart';
import 'package:meetrx/utils/text_styles.dart';

class AddNewPersonalChat extends StatefulWidget {
  @override
  _AddNewPersonalChatState createState() => _AddNewPersonalChatState();
}

class _AddNewPersonalChatState extends State<AddNewPersonalChat> {
  bool isSelected = false;
  int selectedIndex;
  List<Contact> listContact = List();

  @override
  void initState() {
    // TODO: implement initState

    Future<bool> isPermissionEnable = AppUtils.checkPermission();

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

  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Text('Create Chat',
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
              Container(
                height: Sizes.screenHeight - Sizes.appBarHeight - 130,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listContact.length,
                    itemBuilder: (BuildContext builder, int index) {
                      return _buildContactItem(index);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                child: RaisedButton(
                  onPressed: () {
                    //TODO: Submit on pressed
                    Navigator.pop(context);
                    Fluttertoast.showToast(msg: "Create chat clicked");
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
                            'Create Chat ',
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
        ));
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
                    visible: () {
                      if (selectedIndex != null) {
                        if (selectedIndex == index) {
                          return true;
                        } else {
                          return false;
                        }
                      } else {
                        return false;
                      }
                    }(),
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
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
        )
      ],
    ));
  }
}
