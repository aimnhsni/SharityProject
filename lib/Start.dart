import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:sharity_app/Login.dart';
import 'SignUp.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.pushReplacementNamed(context, "/");

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  
  body: Container(
    constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg.jpeg"),
        fit: BoxFit.cover,
        )
      ),

    //You can use any widget
    child: Column(
      children: <Widget>[
        SizedBox(height: 150.0),
        RichText(
                text: TextSpan(
                    text: 'Selamat Datang ke',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold, fontFamily: 'Product Sans',
                        color: Colors.teal),
                    children: <TextSpan>[
                  
                ])),
            SizedBox(height: 30.0),
            Container(
              height: 200,
            
              child:   Image(
                image: AssetImage("images/sharity.jpeg"),//Image.network("https://i.pinimg.com/originals/84/f4/4e/84f44e85d40604e4916b8db475d22ee4.gif"),  
                fit: BoxFit.contain,
              ),

              
            ),

            SizedBox(height: 50.0),

            ElevatedButton(
                  onPressed: navigateToLogin, 
                  
                  child: Text('Jemput masuk! 🎉 ➔', style: TextStyle(color: Colors.teal[300], fontWeight: FontWeight.bold, fontFamily: 'Product Sans'),), 
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: Colors.teal[300],),
                    primary: Colors.white,
                    minimumSize: Size(100, 35),
                  ),
                
       
                  ),
      ],
    ),
    ),

    );
  }
}