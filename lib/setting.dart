import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';


class Setting extends StatefulWidget {


  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
  String _email;
  final auth = FirebaseAuth.instance;

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

    @override
  void initState() {
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
      
          body: Center( child: !isloggedin? AwesomeLoader(
            loaderType: AwesomeLoader.AwesomeLoader3,
            color: Colors.teal,):
          Column(
              children: <Widget>[
                SizedBox(height: 50.0),

              CircleAvatar(
                      

                      radius: 50.0,
                      backgroundColor: Colors.teal,
                      child: const Text('SH',style: TextStyle(color: Colors.white, fontSize: 30),),),  
  
            

             SizedBox(height: 40.0),
 
                Container(
                  
                  child: Text(
                    "Profil Saya", textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'karla'),
                  ),
                ),

                SizedBox(height: 20.0),
              
             
                  Align(
                     
                     alignment: Alignment.topCenter,
                     child: Container(
                       child: FlatButton(
                          color: Colors.teal[50],
                              child: Text('${user.uid} ',style: TextStyle(color: Colors.teal, fontSize: 12,),),
                              onPressed: (){},
                                shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(30.0),    ), 
                                
                            ),
                    // padding: EdgeInsets.only(top:3, left: 10),
                  
                    // width: 340,
                    // height: 30,
        
                    // decoration: BoxDecoration(
                    //   color: Colors.teal[50],
                    //   borderRadius: BorderRadius.circular(20),
                  
                    // ),
                    // child:Row(children: <Widget>[
                    //                 Text(
                    //         "Alamat Unik: ${user.uid}", textAlign: TextAlign.center,
                    //         style:
                    //             TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.teal),
                    //         ),
                    //        FlatButton(
                    //           color: Colors.transparent,
                                
                    //               onPressed: () {
                                  
                    //                 },
                    //                 child: Icon(Icons.info,color: Colors.teal,),
                    //                 minWidth: 5,
                    //             ),
                    // ])
                  ),
                 ),
                 
              
            //  Container(child:
            //          ElevatedButton(onPressed: (){showTopSnackBar(
            //               context,
            //               CustomSnackBar.success(
            //                 message:
            //                     "There is some information. You need to do something with that",
            //               ),
            //           );},

            //                   style: ElevatedButton.styleFrom(
            //                   primary: Colors.transparent,
            //                   elevation: 0,            
            //                   minimumSize: Size(30, 20),
            //                 ),
            //                 child: Icon(Icons.info, color: Colors.teal,),
                            
            //        )
                   
            //  ),
            
               

         Row(
                    children: <Widget>[
                        Expanded(
                            child: Divider(
                              height: 50,
                              color: Colors.black,
                              indent: 40,
                              endIndent: 40,)
                        ),       

       
                    ]
                ),
                

                Container(
                  
                  child: Text(
                    "Nama: ${user.displayName}", textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, fontFamily: 'karla'),
                  ),
                ),
               Container(
                  
                  child: Text(
                    "Email: ${user.email}", textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, fontFamily: 'karla'),
                  ),
                ),


                SizedBox(height: 40.0),


          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                ElevatedButton(
                  onPressed: (){showTopSnackBar(
                          context,
                          CustomSnackBar.info(
                            message:
                                "Fungsi ini tiada pada fasa prototaip",
                                backgroundColor: Colors.teal,
                          ),
                      );}, 
                  child: Text('Kemaskini Profil 🛠', style: TextStyle(color: Colors.teal[300], fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                  style: ElevatedButton.styleFrom(

                    side: BorderSide(width: 1.0, color: Colors.teal[300],),
                    primary: Colors.white,
                    minimumSize: Size(223, 35),
                  ),
       
                  ),
                  

               ElevatedButton(
                  onPressed: (){
                   auth.sendPasswordResetEmail(email: user.email);
                   showTopSnackBar(
                          context,
                          CustomSnackBar.success(
                            message:
                                "Permintaan untuk menukar kata laluan dihantar ke ${user.email}",
                                backgroundColor: Colors.teal,
                          ),
                      );
                  }, 
                  child: Text('Tukar Kata Laluan 🗝', style: TextStyle(color: Colors.teal[300], fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                  style: ElevatedButton.styleFrom(

                    side: BorderSide(width: 1.0, color: Colors.teal[300],),
                    primary: Colors.white,
                    minimumSize: Size(223, 35),
                  ),
       
                  ),

                ElevatedButton(
                  
                  onPressed: signOut, 
                  child: Text('Log Keluar ⛔️', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[300],
                    minimumSize: Size(223, 35),
                  ),
       
                  ),
          
                
              ],
            ),

              ],

            
            ),
          
    ),
      
    );
  }
}