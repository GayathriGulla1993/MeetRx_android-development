import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meetrx/ui/RegistrationScreen.dart';
import 'package:meetrx/ui/initialView.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InitialView(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Center(
        child: Container(child: _loadImage()),
      ),
    );
  }

  Widget _loadImage() {
    return Image.asset(
      'assets/images/meet_rx_logo.png',
      height: 300,
    );
  }
}
