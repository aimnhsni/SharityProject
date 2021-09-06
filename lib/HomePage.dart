
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sharity_app/Login.dart';
import 'package:sharity_app/welocme.dart';
import 'package:sharity_app/map.dart';
import 'package:sharity_app/dashboard.dart';
import 'package:sharity_app/setting.dart';
import 'package:sharity_app/help.dart';
import 'package:sharity_app/location.dart';
import 'package:sharity_app/community.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  
  
  
}



class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  int _currentIndex=0;

  final List<Widget> _children = [

    Welcome(),
    Dashboard(),
    MyCommunity(),
    Map(),
    Setting(),
   

  ];
  

  

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

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
    
  }


   navigateToListHelp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyCommunity()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
        //   appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   automaticallyImplyLeading: false,
        //   iconTheme: IconThemeData(color: Colors.pink),
          
        // //  flexibleSpace: Container(
          
        // //   child: Image.network('https://img.freepik.com/free-vector/charity-doodle-vector-people-donating-things_53876-126415.jpg?size=626&ext=jpg', fit: BoxFit.cover,),
        // // ),
        //   title:  Image.asset('images/title.jpeg', fit: BoxFit.cover, height: 50,),
          
        //   ),
          
        body: _children[_currentIndex],
      
     //   body: Container( 
    //     child: !isloggedin
    //       ? CircularProgressIndicator()
    //       : Column(
    //           children: <Widget>[
    //             SizedBox(height: 40.0),
 
    //             Container(
                  
    //               child: Text(
    //                 "Selamat datang, ${user.displayName} 👋", textAlign: TextAlign.center,
    //                 style:
    //                     TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'karla'),
    //               ),
    //             ),
    //             SizedBox(height: 50.0),

    //             Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[

    //             ElevatedButton(
    //               onPressed: (){},
    //               child: Text('Perlukan Bantuan🆘', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'karla'),), 
    //               style: ElevatedButton.styleFrom(
    //                 primary: Colors.red,
    //                 minimumSize: Size(150, 45),
  
    //               ),
                  
    //               ),
    //             SizedBox(width: 20.0),
    //             ElevatedButton(
    //               onPressed: (){},
    //               child: Text('Ingin Bantu🤝', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'karla'),), 
    //               style: ElevatedButton.styleFrom(
    //                 primary: Colors.pink,
    //                 minimumSize: Size(150, 45),
    //               ),
       
    //               ),

                  
          
                
    //           ],
    //         ),
    //         SizedBox(height: 50.0),
    //         RaisedButton(
    //               padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
    //               onPressed: signOut,
    //               child: Text('Signout',
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20.0,
    //                       fontWeight: FontWeight.bold)),
    //               color: Colors.orange,
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20.0),
    //               ),
    //             ),

    //           ],

            
    //         ),
          
    // ),

    bottomNavigationBar: 
    
    BottomNavigationBar(
      currentIndex: _currentIndex,
      
      type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.teal,
      

      items: [

      BottomNavigationBarItem
       (icon: Icon(Icons.home,),
       title: Text('Home'),
       backgroundColor: Colors.teal,
      
 

    ),

     BottomNavigationBarItem
       (icon: Icon(Icons.analytics),
        title: Text('Analitik'),
        ),
      BottomNavigationBarItem
       (icon: Icon(Icons.people),
        title: Text('Komuniti'),
        ),

     BottomNavigationBarItem
       (icon: Icon(Icons.map),
        title: Text('Peta'),),


    BottomNavigationBarItem
       (icon: Icon(Icons.settings),
        title: Text('Tetapan'),),
        

    ],

    
    onTap: (index){
      setState(() {
        _currentIndex = index;
      });
    },

    )
    
    );
    
  }
}

