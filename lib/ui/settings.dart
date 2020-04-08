import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/sizes.dart';
import 'package:meetrx/utils/text_styles.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<String> settingItemList = [
    'Privacy',
    'Security',
    'Help',
    'Delete my account'
  ];

  List<Icon> settingItemIcon = [
    Icon(
      Icons.account_circle,
      color: AppColors.primary,
    ),
    Icon(
      Icons.security,
      color: AppColors.primary,
    ),
    Icon(
      Icons.help,
      color: AppColors.primary,
    ),
    Icon(
      Icons.delete,
      color: Colors.red,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: _buildListTile(
                  settingItemIcon[index], settingItemList[index], index),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Divider(),
              ),
            );
          },
          itemCount: settingItemList.length),
    );
  }

  Widget _buildListTile(Icon icon, String title, int index) {
    return ListTile(
      leading: icon,
      contentPadding: EdgeInsets.all(0),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 14,
            color: index == 3 ? Colors.red : Colors.black),
      ),
      onTap: () {
        if (index == 3) {
          openAlertBox();
        } else {
          Fluttertoast.showToast(msg: "clicked");
        }
      },
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
              child: ListView(
                shrinkWrap: true,
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
                      'Delete account',
                      style: TextStyles.drawerHeaderUserNameTextLabel,
                    )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: Text(
                      'You are about to delete account',
                      style: TextStyle(fontFamily: 'Muli-Bold', fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 10, right: 20),
                    child: Text(
                      'This will delete your account from MeetRx! Are you sure ?',
                      style: TextStyle(
                          fontFamily: 'Muli-Bold',
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, top: 20, right: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () {
                                //TODO: Submit on pressed
                                Navigator.pop(context);
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0)),
                              ),
                              color: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: RaisedButton(
                              onPressed: () {
                                //TODO: Submit on pressed

                                Navigator.pop(context);
                                Fluttertoast.showToast(msg: "Deleted");
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20.0)),
                              ),
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
