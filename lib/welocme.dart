import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharity_app/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sharity_app/help.dart';
import 'package:sharity_app/inginbantu.dart';
import 'package:sharity_app/location.dart';
import 'package:sharity_app/Listhelp.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';





class Welcome extends StatefulWidget {

  @override
  _WelcomeState createState() => _WelcomeState();
}




class _WelcomeState extends State<Welcome> {
  @override
  

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
 checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }


  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

    navigateToHelpSeeker() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyLocation()));
  }


   navigateToListHelp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListHelp()));
  }

     navigateToHelper() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Helper()));
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
    
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.pink),
          
        //  flexibleSpace: Container(
          
        //   child: Image.network('https://img.freepik.com/free-vector/charity-doodle-vector-people-donating-things_53876-126415.jpg?size=626&ext=jpg', fit: BoxFit.cover,),
        // ),
          title:  Image.asset('images/title.jpeg', fit: BoxFit.cover, height: 50,),
          
          ),

    
   body:  Center( 
        child: !isloggedin? AwesomeLoader(
            
            loaderType: AwesomeLoader.AwesomeLoader3,
            color: Colors.teal,)
          : Column(
              children: <Widget>[

              Container(
              height: 300,
            
              child:   Image.asset('images/hello.gif',width: 350,),
              // Image.network("https://i.pinimg.com/originals/dd/5a/31/dd5a31c736d9944eccd18bc9372274ab.png"), 
  
            ),
          
           

   

                RichText(
                text: TextSpan(
                    text: 'Selamat Datang, ',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'karla',
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: '${user.displayName} 👋',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'karla',
                          color: Colors.teal))
                ])),
                            
                SizedBox(height: 20.0),

                Container(
                  
                    width: 300,
                    height: 100,
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                    
                    
                    child: Text(
                    "Pilih tujuan anda dengan menekan salah satu butang di bawah.👇", textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, fontFamily: 'karla'),
                    ),
           
                    

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(1, 2), // Shadow position
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.0),

                Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                ElevatedButton(
                  onPressed: navigateToHelpSeeker,
                  child: Text('Perlukan Bantuan🆘', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'karla'),), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                    minimumSize: Size(150, 45),
  
                  ),
                  
                  ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: navigateToHelper,
                  child: Text('Ingin Bantu🤝', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'karla'),), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[300],
                    minimumSize: Size(150, 45),
                  ),
       
                  ),
              ],
              ),
              
              

        Padding(
              padding: const EdgeInsets.only(top:30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget> [
                    
                    FloatingActionButton(
                      onPressed: navigateToListHelp,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.list, size: 36.0, color: Colors.teal,),
                    ),
                   
  
                  
                  ],
                ),
                
              ),
            ),
            

              ],

            
            ),
          
    ),
    

      
    );
  }
}

 