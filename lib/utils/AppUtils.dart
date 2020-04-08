import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppUtils {
  static TextStyle textStyle(Color color, double size, FontWeight fontWeight) {
    return TextStyle(
        fontFamily: 'Muli',
        color: color,
        fontSize: size,
        fontWeight: fontWeight);
  }

  static TextStyle hintTextStyle() {
    return TextStyle(
      fontFamily: 'Muli',
    );
  }

  static Future<bool> checkPermission() async {
    var status = await Permission.contacts.status;

    if (!status.isGranted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.contacts,
      ].request();
    }

    return status.isGranted;
  }
}
