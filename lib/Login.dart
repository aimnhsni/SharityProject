import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SignUp.dart';
import 'package:sharity_app/reset.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email='', _password='';

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);

        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
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
            title: Text('Error⚠️'),
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

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

   ResetPass() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ResetScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      backgroundColor: Colors.white,          
      
      // appBar: AppBar( toolbarHeight: 300,
      // centerTitle: true,
      // backgroundColor: Colors.white,  
      // automaticallyImplyLeading: false,
      // elevation: 1,
      // title: Image(

      //           image: AssetImage("images/login.jpeg"),
      //           height: 1000,
      //           fit: BoxFit.contain,
      //         ),
 
      // ),


      body:  SingleChildScrollView( 


        


        child: Column(
          children: <Widget>[

            
                        //SizedBox(height: 50),
            Container(
              height: 5,
              // child: Image(
              //   image: AssetImage("images/sharity.jpeg"),
              //   fit: BoxFit.contain,
              // ),
            ),
            SizedBox(height:80),

            Image.asset('images/login2.jpeg',width: 350,),

            SizedBox(height:10),

            
           
             Container(

                  
                  child: Text(
                    "Mulakan Langkah Anda Di Sini 🚀", textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'karla', color: Colors.teal),
                  ),
                   
                ),
                SizedBox(height: 20),

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
                            if (input.isEmpty) return 'Masukkan Emel';
                          },
                          decoration: InputDecoration(
                              labelText: '✉️ Emel',
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
                          onSaved: (input) => _email = input),),

                    ),

                    SizedBox(height: 20),

                    Container(

                      child: ConstrainedBox(
                         constraints: BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                          validator: (input) {
                            if (input.length < 6)
                              return 'Minimum 6 karakter';
                          },
                          decoration: InputDecoration(
                            labelText: '🔒 Kata Laluan',
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
                          onSaved: (input) => _password = input),),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                  onPressed: login, 
                  child: Text('Log Masuk ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                  style: ElevatedButton.styleFrom(
                    
                    primary: Colors.teal,
                    minimumSize: Size(100, 35),
                  ),
       
                  ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            GestureDetector(
              
              child: Text(' Belum mendaftar?❌', style: TextStyle(color: Colors.teal),),
              onTap: navigateToSignUp,
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              child: Text(' Lupa Kata Laluan?😢' , style: TextStyle(color: Colors.teal),),
              onTap: ResetPass,
            )
          ],
        ),
      ),
    );
    
  }
}