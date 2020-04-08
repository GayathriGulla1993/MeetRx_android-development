import 'package:flutter/material.dart';

import 'RegistrationScreen.dart';

class InitialView extends StatefulWidget {
  @override
  InitialViewState createState() => InitialViewState();
}

class InitialViewState extends State<InitialView> {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage(
        'images/meetrx.png'); //<- Creates an object that fetches an image.
    var image = new Image(image: assetsImage, fit: BoxFit.cover);
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Image(
                image: assetsImage,
                fit: BoxFit.fill,
                alignment: Alignment.center,
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 350,
              height: 55,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      ));
                },
                elevation: 5.0,
                color: Color(0xFF1976D2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Get Started', style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 20.0)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 350,
              height: 55,
              child: RaisedButton(
                onPressed: () {},
                elevation: 5.0,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Sign in with Google',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20.0,
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 350,
              height: 55,
              child: RaisedButton(
                onPressed: () {},
                elevation: 5.0,
                color: Color(0xFF7986CB),
                child: Text('Sign in with facebook',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),

            //),
          ],
        )));
  }
}
