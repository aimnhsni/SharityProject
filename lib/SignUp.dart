import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharity_app/Login.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}



class _SignUpState extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  

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
  

  String _name,_phone, _email, _password;

  

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

   navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        if (user != null) {
          // UserUpdateInfo updateuser = UserUpdateInfo();
          // updateuser.displayName = _name;
          //  user.updateProfile(updateuser);
          await _auth.currentUser.updateProfile(displayName: _name);
  
          

          // await Navigator.pushReplacementNamed(context,"/") ;

        }
      } catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 90),
            Container(
              height: 200,
              child: Image(
                image: AssetImage("images/sharity.jpeg"),
                fit: BoxFit.contain,
              ),
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Masukkan nama pengguna';
                          },
                      
                          decoration: InputDecoration(
                            labelText: '🧍 Nama Pengguna',
                            hintText: 'Ahmad',
                            hintStyle: TextStyle(fontSize: 12),
                            fillColor: Colors.grey[100],
                            filled: true,
                            labelStyle: TextStyle(
                               color: Colors.teal[300],
                               fontSize: 15
                             ),
                             
                            
                            enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide.none
                               
                            ),
                            errorBorder: OutlineInputBorder(
                               borderSide: BorderSide.none
                              
                            ),
                          ),
                          onSaved: (input) => _name = input),
                    ),),
                    //  Container(
                    //    child: ConstrainedBox(
                    //     constraints: BoxConstraints.tightFor(width: 300),
                        
                    //   child: TextFormField(
                    //       validator: (input) {
                    //         if (input.length<10 || input.length>11) return 'Enter valid phone number';
                    //       },
                    //       keyboardType: TextInputType.number,
                    //       inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly],
                    //       decoration: InputDecoration(
                    //         labelText: 'No  Telefon',
                    //         prefixIcon: Icon(Icons.phone),
                            
                    //       ),
                    //       onSaved: (input) => _phone = input),
                    // ),),
                    SizedBox(height: 20,),

                    Container(
                      child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                          validator: (input) {
                            if (input.isEmpty) return 'Masukkan alamat emel yang sah';
                          },
                          decoration: InputDecoration(
                              labelText: '✉️ Emel',
                              hintText: 'example@domain.com',
                              hintStyle: TextStyle(fontSize: 12),
                              fillColor: Colors.grey[100],
                              filled: true,
                            
                              labelStyle: TextStyle(
                                color: Colors.teal[300],
                                fontSize: 15
                              ),
                             
                            
                            enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide.none
                               
                            ),
                            errorBorder: OutlineInputBorder(
                               borderSide: BorderSide.none
                              
                            ),
                            ),
                              

                          onSaved: (input) => _email = input),
                    ),),
                    SizedBox(height: 20,),

                    Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                          validator: (input) {
                            if (input.length < 6)
                              return 'Masukkan minimum 6';
                          },
                          decoration: InputDecoration(
                            labelText: '🗝 Kata Laluan',
                            hintText: 'Minimum 6 karakter',
                            hintStyle: TextStyle(fontSize: 12),
                            fillColor: Colors.grey[100],
                            filled: true,
                            
                            labelStyle: TextStyle(
                               color: Colors.teal[300],
                               fontSize: 15
                             ),
                             
                            
                            enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide.none
                               
                            ),
                            errorBorder: OutlineInputBorder(
                               borderSide: BorderSide.none
                              
                            ),
                          ),
                          obscureText: true,
                          onSaved: (input) => _password = input),
                    ),),
                    SizedBox(height: 20),
                  ElevatedButton(
                    
                        onPressed: signUp, 
                        child: Text('Daftar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                        style: ElevatedButton.styleFrom(
                          
                          primary: Colors.teal,
                          minimumSize: Size(220, 35),
                        
                        ),
            
                        ),

                  ],
                ),

              ),
            ),


                Row(
                    children: <Widget>[
                        Expanded(
                            child: Divider(
                              height: 50,
                              color: Colors.black,
                              indent: 20,
                              endIndent: 20,)
                        ),       

                        Text("atau"),        

                        Expanded(
                            child: Divider(
                              height: 50,
                              color: Colors.black,
                              indent: 20,
                              endIndent: 20,
                            )
                        ),
                    ]
                ),
              SignInButton(Buttons.Google,
                text: "Daftar melalui Google", onPressed: googleSignIn),

           SizedBox(height: 20.0),
            GestureDetector(
              child: Text('Sudah mempunyai akaun?✅' , style: TextStyle(color: Colors.teal),),
              onTap: navigateToLogin,
            )
          ],
        ),
      ),
    ));
  }
}