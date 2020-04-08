import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meetrx/ui/AddNewPersonalChat.dart';
import 'package:meetrx/ui/CreateGroupScreen.dart';
import 'package:meetrx/ui/ProfileScreen.dart';
import 'package:meetrx/ui/notifications.dart';
import 'package:meetrx/ui/settings.dart';
import 'package:meetrx/utils/AppUtils.dart';
import 'package:meetrx/utils/Colors.dart';
import 'package:meetrx/utils/data.dart';
import 'package:meetrx/utils/routes.dart';
import 'package:meetrx/utils/sizes.dart';
import 'package:meetrx/utils/text_styles.dart';
import 'package:meetrx/widgets/chat_item.dart';

import 'AddEventBottomSheet.dart';

class EventDashboardScreen extends StatefulWidget {
  @override
  _EventDashboardScreenState createState() => _EventDashboardScreenState();
}

class _EventDashboardScreenState extends State<EventDashboardScreen> {
  int selectedIndex = 0;

  BuildContext _buildBottomSheetContext;

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
              'MeetRx',
              style: TextStyle(color: Colors.white, fontFamily: 'Muli'),
            )
          ],
        ),
        actions: <Widget>[
          Visibility(
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch(context));
              },
            ),
            visible: () {
              if (selectedIndex == 0) {
                return false;
              } else if (selectedIndex == 1) {
                return true;
              } else {
                return true;
              }
            }(),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                    child: Container(
                      width: 80,
                      height: 80,
                      color: Colors.white,
                      child: Image.asset(
                        "assets/images/user_profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Dr. John Abraham',
                      style: TextStyles.drawerHeaderUserNameTextLabel,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey[800],
              ),
              title: new Text(
                "Profile",
                style: TextStyles.drawerItemTextLabel,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.lock_outline,
                color: Colors.grey[800],
              ),
              title: new Text(
                "Account",
                style: TextStyles.drawerItemTextLabel,
              ),
              onTap: () {
                Fluttertoast.showToast(msg: "Account");
                AppRoutes.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.grey[800],
              ),
              title: new Text(
                "Notification",
                style: TextStyles.drawerItemTextLabel,
              ),
              onTap: () {
                AppRoutes.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[800],
              ),
              title: new Text(
                "Settings",
                style: TextStyles.drawerItemTextLabel,
              ),
              onTap: () {
                AppRoutes.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.grey[800],
              ),
              title: new Text(
                "Help",
                style: TextStyles.drawerItemTextLabel,
              ),
              onTap: () {
                Fluttertoast.showToast(msg: "Help");
                AppRoutes.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.grey[800],
              ),
              title: new Text(
                "Invite",
                style: TextStyles.drawerItemTextLabel,
              ),
              onTap: () {
                /* Share.share(
                    'I found a wonderful application for doctors to share events and lot more "MeetRx"');
                //Fluttertoast.showToast(msg: "Invite");
                AppRoutes.pop(context);*/
              },
            ),
            ListTile(
              leading: Icon(
                Icons.trending_flat,
                color: Colors.grey[800],
              ),
              title: new Text(
                "Logout",
                style: TextStyles.drawerItemTextLabel,
              ),
              onTap: () {
                Fluttertoast.showToast(msg: "Logout");
                AppRoutes.pop(context);
              },
            )
          ],
        ),
      ),
      body: () {
        if (selectedIndex == 0) {
          return _buildEventList();
        } else if (selectedIndex == 1) {
          return _buildPersonalChatList();
        } else {
          return _buildGroupChatList();
        }
      }(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _addEventBottomSheet(context);
        },
        child: Icon(
          Icons.add,
        ),
        mini: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'HOME',
                style: TextStyles.bottomNavigationBarTextLabel,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              title: Text(
                'PERSONAL CHAT',
                style: TextStyles.bottomNavigationBarTextLabel,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.group),
              title: Text(
                'GROUP CHAT',
                style: TextStyles.bottomNavigationBarTextLabel,
              )),
        ],
        currentIndex: selectedIndex,
        fixedColor: AppColors.primary,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget _buildGroupChatList() {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Divider(),
          ),
        );
      },
      itemCount: groups.length,
      itemBuilder: (BuildContext context, int index) {
        Map chat = groups[index];
        return ChatItem(
          dp: chat['dp'],
          name: chat['name'],
          isOnline: chat['isOnline'],
          counter: chat['counter'],
          msg: chat['msg'],
          time: chat['time'],
        );
      },
    );
  }

  Widget _buildPersonalChatList() {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      separatorBuilder: (BuildContext context, int index) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Divider(),
          ),
        );
      },
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        Map chat = chats[index];
        return ChatItem(
          dp: chat['dp'],
          name: chat['name'],
          isOnline: chat['isOnline'],
          counter: chat['counter'],
          msg: chat['msg'],
          time: chat['time'],
        );
      },
    );
  }

  Widget _buildEventList() {
    return Padding(
      padding: Sizes.spacingAllExtraSmall,
      child: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: ClipOval(
                      child: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.cloud_download,
                      color: Colors.black,
                    ),
                    color: AppColors.secondaryColor,
                  )),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Medical Innovation Summit - New Delhi',
                        style: TextStyles.mediumTextLabel,
                      ),
                      Text(
                        'On 22-02-2020, New Delhi, IND',
                        style: TextStyles.smallTextLabel,
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                    onTapDown: (TapDownDetails details) {
                      _showPopupMenu(details.globalPosition);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/event_background.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.thumb_up,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            Text(
                              '  783',
                              style: TextStyles.smallTextPrimaryColorLabel,
                            ),
                            Text(
                              '  Likes',
                              style: TextStyles.smallTextPrimaryColorLabel,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.message,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            Text(
                              '  57',
                              style: TextStyles.smallTextPrimaryColorLabel,
                            ),
                            Text(
                              '  Comments',
                              style: TextStyles.smallTextPrimaryColorLabel,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: AppColors.primary,
                              size: 20,
                            ),
                            Text(
                              '  Share',
                              style: TextStyles.smallTextPrimaryColorLabel,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  offset: new Offset(0.0, 3.0),
                ),
              ],
            ),
            margin: EdgeInsets.all(5.0),
            height: 354.0,
            width: 100.0,
          );
        },
      ),
    );
  }

  void _showPopupMenu(Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: [
        PopupMenuItem(
            child: GestureDetector(
          child: Text(
            "Open in group",
            textAlign: TextAlign.center,
            style: TextStyles.popupMenuItemTextLabel,
          ),
          onTap: () {
            Fluttertoast.showToast(msg: "Open in group");
          },
        )),
        PopupMenuItem(
          child: GestureDetector(
            child: Text(
              "Delete",
              textAlign: TextAlign.center,
              style: TextStyles.popupMenuItemTextLabel,
            ),
            onTap: () {
              Fluttertoast.showToast(msg: "Delete");
            },
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  void _addEventBottomSheet(BuildContext context) {
    _buildBottomSheetContext = context;

    showModalBottomSheet(
        elevation: 10,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext buildContext) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: () {
              if (selectedIndex == 0) {
                return AddEventBottomSheet();
              } else if (selectedIndex == 1) {
                return AddNewPersonalChat();
              } else {
                return CreateGroupScreen();
              }
            }(),
          );
        });
  }
}

class DataSearch extends SearchDelegate<String> {
  BuildContext buildContext;
  bool isSelected = false;

  DataSearch(this.buildContext);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        //transitionAnimation is override method for searchsearch delegate
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    /*var countryName = appData.country
        .where((obj) => obj.startsWith(query.isNotEmpty
        ? query[0].toUpperCase() + query.substring(1)
        : " "))
        .toList();

    var suggestionList = query.isEmpty ? appData.country : countryName;*/

    return ListView.builder(
      itemBuilder: (context, index) => Container(
        height: 50,
        child: Card(
          child: Center(
            child: ListTile(
              onTap: () {
                // showResults(context);
                /* appData.name =
                query.isEmpty ? appData.country[index] : countryName[index];
                appData.selectedCountryName = appData.name;
                print(appData.name);
                String str = appData.name;
                String start = "(";
                String end = ")";
                final startIndex = str.indexOf(start);
                final endIndex = str.indexOf(end, startIndex + start.length);
                // print(str.substring(startIndex + start.length, endIndex)); // br
                appData.code =
                    str.substring(startIndex + start.length, endIndex);
                appData.countryId = appData.mapCountryId[appData.name
                    .toString()
                    .replaceAll("(" + appData.code + ")", '')];
                Navigator.pop(buildContext);
                //Navigator.of(context).pop();
                Navigator.pop(
                    context,
                    query.isEmpty
                        ? appData.country[index]
                        : countryName[index]);*/
              },
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: RichText(
                  text: TextSpan(
                    text: "Lenard Milton",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'montserrat',
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      itemCount: 1,
    );
  }
}
