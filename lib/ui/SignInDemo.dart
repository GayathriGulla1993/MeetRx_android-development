import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ['profile','email']
);

//void main() => runApp(MaterialApp(
//  title: 'Google Login Demo',
//  home: SignInDemo(),
//));

class SignInDemo extends StatefulWidget{
  @override
  SignInDemoState createState() => SignInDemoState();
}

class SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Sign In'),),
        body: Container(
          child: _buildBody(),
        ),
      ),
    );

//
//    return MaterialApp(
//      title: 'Sign In Demo',
//      home: Container(
//        child: _buildBody(),
//      ),
//    );

  }

  Widget _buildBody() {
    if (_currentUser != null) {
      print(_currentUser.displayName);
      print(_currentUser.email);

      return Column(
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName),
            subtitle: Text(_currentUser.email),
          ),
          RaisedButton(onPressed: () {
            _handleSignOut();
          },child: Text('Sign Out'),)
        ],
      );

//      return MaterialApp(
//      home: Column(
//        children: <Widget>[
//          ListTile(
//            leading: GoogleUserCircleAvatar(
//              identity: _currentUser,
//            ),
//            title: Text(_currentUser.displayName),
//            subtitle: Text(_currentUser.email),
//          ),
//          RaisedButton(onPressed: () {
//            _handleSignOut();
//          },child: Text('Sign Out'),)
//        ],
//      ),
//      );
    }
    else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(padding: EdgeInsets.all(15.0),child:Text('You are not Signed in.Please Sign In',style: TextStyle(fontSize: 15.0),)),
            //Text('You have not been signed in'),
            Center(
              child: RaisedButton(
                onPressed: (){
                  _handleSignIn();
                },
                child: Text('Sign In'),
              ),
            )
          ],
        );
      //);
    }
  }


  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    }
    catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() {
    _googleSignIn.disconnect();
  }
}
