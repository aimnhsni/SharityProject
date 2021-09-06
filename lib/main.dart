import 'package:sharity_app/Login.dart';
import 'package:sharity_app/SignUp.dart';
import 'package:sharity_app/Start.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sharity_app/welocme.dart';
import 'Homepage.dart';
import 'package:sharity_app/help.dart';
import 'package:sharity_app/Listhelp.dart';
import 'package:sharity_app/community.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MyApp());
   }


   

class MyApp extends StatelessWidget {



  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      theme: ThemeData(
        primaryColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: 
    
      HomePage(),

      routes: <String,WidgetBuilder>{

        "Login" : (BuildContext context)=>Login(),
        "SignUp":(BuildContext context)=>SignUp(),
        "start":(BuildContext context)=>Start(),
        "listHelp":(BuildContext context)=>ListHelp(),
        
       
       
      },
      
      
    );
  }

}


