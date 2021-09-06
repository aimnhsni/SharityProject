

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharity_app/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sharity_app/HomePage.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';




class MyCommunity extends StatefulWidget {
  @override
  _MyCommunityState createState() => _MyCommunityState();
}


class _MyCommunityState extends State<MyCommunity> {
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  


  CrudMethods crudMethods = new CrudMethods();

  String _feedback, _nama;
  String _chosenValue;



  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getLoc();
  //   this.checkAuthentification();
  //   this.getUser();

  // }



 
     uploadFeedback() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      /// uploading image to firebase storage
 

      Map<String, String>DataCommunity = {

        // "uid": '${user.uid}',
        // 'location': '${_initialcameraposition}',
        "nama": _nama,
        "feedback": _feedback,
        "type": _chosenValue,
        // "desc": _butiran,
        // "date": _dateTime
  
      };

       if (_chosenValue == null) {

            showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message:
                      "Sila pilih jenis perkongsian!",
                ),
            );
                                  
        }

        else{

      crudMethods.addDataCommunity(DataCommunity).then((result) {
          showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Terima kasih kerana berkongsi', style: TextStyle(color: Colors.green),),
            content: Text("Anda akan dibawa ke halaman utama"),
            
            actions: <Widget>[
              FlatButton(
                  onPressed: navigateTopage,
                  child: Text('OK'))
            ],
          );
        });
         
      });
    } 
  }
    else{}
  }


   navigateTopage() async {
    Navigator.pushReplacementNamed(context, '/');
  }

  showDelete() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Padam?'),
            content: Text('Anda pasti?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ya'))
            ],
          );
        });
  }




  @override
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

 
      
      body: SlidingUpPanel(
            
            collapsed: Column(  
               children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
                 
            
            SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                    
                  ),
                ),
              ],
      ),]),
    
      borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
      
      panel: Column(          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Berkongsi bersama komuniti 👨‍👨‍👧‍👦",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
               
              ],
      ),

      Container(
              height: 150,
              width: 300,
            
              child:   Image.network("https://cdn.nohat.cc/thumb/f/720/268c2dd298574559991e.jpg"), 
  
            ),
    
      

               Container(
                        padding: const EdgeInsets.all(0.0),
                        child: DropdownButton<String>(
                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),

                          items: <String>[
                            'Report',
                            'Feedback',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "Sila pilih jenis perkongsian:",
                            style: TextStyle(
                                color: Colors.teal[300],
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          
                          onChanged: (String value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
      
             Container(child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                    
                    Container(
                      child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                        
                          validator: (input) {
                            if (input.isEmpty) return 'Masukkan nama anda';
                          },
                      
                          decoration: InputDecoration(
                            
                          
                            
                            fillColor: Colors.grey[200],
                            filled: true,
                            labelText: 'Nama',
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
                          onSaved: (input) => _nama = input),
                    ),
                    
                    
                  ),

                  SizedBox(height: 10,),

                    Container(
                      child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                        
                          validator: (input) {
                            if (input.isEmpty) return 'Masukkan butiran';
                          },
                      
                          decoration: InputDecoration(
                            
                          
                            
                            fillColor: Colors.grey[200],
                            filled: true,
                            labelText: 'Kongsikan sesuatu...',
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
                          onSaved: (input) => _feedback = input),
                    ),
                    
                    
                  ),
                
                      
      

                    SizedBox(height: 20.0),
                          ElevatedButton(
                            
                            onPressed: uploadFeedback, 
                            child: Text('Hantar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                            style: ElevatedButton.styleFrom(

                              primary: Colors.teal[300],
                            
                              minimumSize: Size(100, 35),
                            ),
                
                            ),


                
     

                  ],
                
                ),
                

              ),
        ),
      ),
      
      
      ]),

      body:  Container (
            margin: EdgeInsets.only(bottom: 270),

            child :StreamBuilder(


      
            stream: Firestore.instance.collection("feedback").snapshots(),
            builder: (context, snapshot){
       
              if(snapshot.data == null) return AwesomeLoader(
            loaderType: AwesomeLoader.AwesomeLoader3,
            color: Colors.teal,);
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  DocumentSnapshot location = snapshot.data.documents[index];

              return ListBody(
                

                children: <Widget>[

                 Container(

                   padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                   
                   decoration: BoxDecoration( 
         
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0.5, 1), // Shadow position
                        ),]
                      
                      ),

                        
                  margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
                

                  child: SingleChildScrollView(
                    child: ListTile(
                     onLongPress: showDelete,
                    leading: CircleAvatar(
                    
                      radius: 30.0,
                      backgroundColor: Colors.teal,
                      child: const Text('SH',style: TextStyle(color: Colors.white),),),
                      

                    title: Text(location['nama'], style: TextStyle(color: Colors.teal),),
                    subtitle: Text(location['feedback' ]),
                    trailing:Container(padding: EdgeInsets.only(top:3),
                    
                  
                    width: 60,
                    height: 20,
                    child: Text(
                    location['type'], textAlign: TextAlign.center,
                    
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.pink),
                    ),
           
                    

                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(20),
                  
                    ),
                    ),
                    dense: true,
                    
                    
                    
                    
                  ),
                ),
            
              ),


              //    Container(

              //      padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
              //      decoration: BoxDecoration( 
         
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(5),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey,
              //             blurRadius: 2,
              //             offset: Offset(0.5, 1), // Shadow position
              //           ),]
                      
              //         ),

                        
              //     margin: EdgeInsets.fromLTRB(12, 5, 12, 5),

              //     child: SingleChildScrollView(
              //       child: ListTile(
              
              //       leading: CircleAvatar(
                      

              //         radius: 30.0,
              //         backgroundColor: Colors.teal,
              //         child: const Text('SH',style: TextStyle(color: Colors.white),),),
                      

              //       title: Text(location['nama'], style: TextStyle(color: Colors.teal),),
              //       subtitle: Text(location['feedback' ]),
              //       trailing:Container(padding: EdgeInsets.only(top:3),
                  
              //       width: 60,
              //       height: 20,
              //       child: Text(
              //       location['type'], textAlign: TextAlign.center,
                    
              //       style:
              //           TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.red),
              //       ),
           
                    

              //       decoration: BoxDecoration(
              //         color: Colors.red[50],
              //         borderRadius: BorderRadius.circular(20),
                  
              //       ),
              //       ),
              //       dense: true,
                    
                    
                    
                    
              //     ),
              //   ),
            
              // ),
                  
                ]
              ,);

                },
               );
              },
            
              ),
             
            ),),


    //   body:  SingleChildScrollView(
    //     child: 
    //     Container(child: Center(
    //           child: Form(
    //             key: _formKey,
    //             child: Column(
    //               children: <Widget>[
    //                 SizedBox(height: 20,),
                    
    //                 Container(
    //                   child: ConstrainedBox(
    //                   constraints: BoxConstraints.tightFor(width: 300),
    //                   child: TextFormField(
                        
    //                       validator: (input) {
    //                         if (input.isEmpty) return 'Masukkan butiran';
    //                       },
                      
    //                       decoration: InputDecoration(
                            
                          
                            
    //                         fillColor: Colors.grey[200],
    //                         filled: true,
    //                         labelText: 'Write Feedback/report/information...',
    //                         labelStyle: TextStyle(
    //                            color: Colors.teal[300],
    //                            fontSize: 15
    //                          ),
                             
                            
    //                         enabledBorder: OutlineInputBorder(
    //                           borderSide:BorderSide.none
                              
    //                         ),
    //                         focusedBorder: OutlineInputBorder(
    //                            borderSide: BorderSide.none
                               
    //                         ),
    //                         errorBorder: OutlineInputBorder(
    //                            borderSide: BorderSide.none
                              
    //                         ),
                          
                            
                            
                            
    //                       ),
    //                       onSaved: (input) => _feedback = input),
    //                 ),
                    
                    
    //               ),

    //                 SizedBox(height: 20.0),
    //                       ElevatedButton(
                            
    //                         onPressed: uploadFeedback, 
    //                         child: Text('Hantar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
    //                         style: ElevatedButton.styleFrom(

    //                           primary: Colors.teal[300],
                            
    //                           minimumSize: Size(100, 35),
    //                         ),
                
    //                         ),


                
     

    //               ],
                
    //             ),
                

    //           ),
    //     ),
    //   ),
      
    // ),
    


    );
  }

}


  
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String,WidgetBuilder>{


        "community":(BuildContext context)=>MyCommunity(),
       
      },
    );

  }
