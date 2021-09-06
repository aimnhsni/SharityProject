import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:sharity_app/crud.dart';

class ListHelp extends StatefulWidget {

  @override
  _ListHelpState createState() => _ListHelpState();
}

class _ListHelpState extends State<ListHelp> {
  



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title:  Text('Senarai'),
          bottom: TabBar(
          indicatorColor: Colors.teal,
          indicatorSize: TabBarIndicatorSize.label,  
          
   
           tabs: [
              Tab(icon: FaIcon(FontAwesomeIcons.handHoldingHeart, color: Colors.teal[300],), text: "Perlu Bantuan🆘",),
              Tab(icon: FaIcon(FontAwesomeIcons.handsHelping, color: Colors.teal[300]), text: "Ingin Bantu🤝"),
          ],),
        
          ),
          body: TabBarView(
          children: [
            Center( child: Container (
            
            child: Column( children: <Widget>[


                    Expanded(

                      child : StreamBuilder(


                  
                        stream: Firestore.instance.collection("location").snapshots(),
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
                              
                              
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
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

                              child: Column(
                              
                              children: <Widget>[ 

                                Row(children:<Widget>[

                              Align(
                                
                                alignment: Alignment.topLeft,
                                child: Container(
                                padding: EdgeInsets.only(top:3),
                              
                                width: 100,
                                height: 20,
                                child: Text(
                                "Perlu bantuan🆘", textAlign: TextAlign.center,
                                
                                style:
                                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.red),
                                ),
                      
                                

                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(20),
                              
                                ),
                                
                              ),
                              ),
                              SizedBox(width: 10,),

                                  Align(
                                
                                alignment: Alignment.topLeft,
                                child: Container(
                                padding: EdgeInsets.only(top:3),
                              
                                width: 100,
                                height: 20,
                                child: Text(location['cat'], textAlign: TextAlign.center,
                                
                                style:
                                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.teal),
                                ),
                      
                                

                                decoration: BoxDecoration(
                                  color: Colors.teal[50],
                                  borderRadius: BorderRadius.circular(20),
                              
                                ),
                                
                              ),
                              ),

                               SizedBox(width: 70,),
                        
                              

                                  PopupMenuButton(
                                      
                                      
                                      onSelected: (value) {
                                                          value();
                                                        },
                                                    
                                      icon: Icon(Icons.more_horiz),
                                      itemBuilder: (context) => [

                                        PopupMenuItem(
                                          child: Text("delete", textAlign: TextAlign.center,),
                                          value: ()  {
                                              
                                            
                                        },
                                                          
                                        ),
                                      ]
                                  )
                        
                              ]),
                              SizedBox(height: 10,),
                              

                              
                                      Row(
                                        children:[
                                      Text(location['nama'], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.teal[300])),
                                      Text('@', style: TextStyle(fontSize: 10)),
                                      SelectableText(location['uid'], style: TextStyle(fontSize: 10)),
                            
                                      ]
                                      ),
                                      Row(
                                        children: <Widget>[
                                          
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(location['desc']),
                                                  
                                                  SizedBox(height: 30,),
                                                  Row(
                                                    children: [
                                                      Text(location['date'], style: TextStyle(fontSize: 10),), 
                                                      Text('• ', style: TextStyle(fontSize: 10),), 
                                                      Text(location['kawasan'], style: TextStyle(fontSize: 10, color: Colors.teal),)],
                                                      
                                                  ),
                                                  

                                                
                                                  
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Column(
                                            
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[

                                              ElevatedButton(
                                                onPressed: (){
                                                  launch(('tel://${location['tel']}'));
                                                                    },
                                                child: Icon(FontAwesomeIcons.phone, size: 13,),
                                                style: ElevatedButton.styleFrom(

                                                  primary: Colors.red,
                                                  padding: const EdgeInsets.all(3.0),
                                                  minimumSize: Size(50, 35),
                                                ),
                                    
                                                ),

                                          ElevatedButton(
                                                onPressed: (){
                                                  launch(('whatsapp://send?phone=6${location['tel']}&text=Hi, saya dari Sharity App ingin bantu.'));
                                                                    },
                                                child: Icon(FontAwesomeIcons.whatsapp, size: 13,),
                                                style: ElevatedButton.styleFrom(

                                                  primary: Colors.green,
                                                  padding: const EdgeInsets.all(3.0),
                                                  minimumSize: Size(50, 35),
                                                ),
                                    
                                                ),
                        
                                  
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                              
                            ]
                          ,);

                            },
                          );
                        },
                        
                        ),
                      )
                  ]),
                )),


    //inginbantu tab view page


            Center( child: Container (
            
            child: Column( children: <Widget>[


                    Expanded(

                      child : StreamBuilder(


                  
                        stream: Firestore.instance.collection("inginBantu").snapshots(),
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
                              

                              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
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

                              child: Column(
                              
                              children: <Widget>[ 

                                
                              
                              Row(children: <Widget>[

                              Align(
                                
                                alignment: Alignment.topLeft,
                                child: Container(
                                padding: EdgeInsets.only(top:3),
                              
                                width: 100,
                                height: 20,
                                child: Text(
                                "ingin Bantu🤝", textAlign: TextAlign.center,
                                
                                style:
                                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.green),
                                ),
                      
                                

                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(20),
                              
                                ),
                                
                              ),
                              ),
                              
                                   SizedBox(width: 10,),

                                  Align(
                                
                                alignment: Alignment.topLeft,
                                child: Container(
                                padding: EdgeInsets.only(top:3),
                              
                                width: 100,
                                height: 20,
                                child: Text(location['cat'], textAlign: TextAlign.center,
                                
                                style:
                                    TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.teal),
                                ),
                      
                                

                                decoration: BoxDecoration(
                                  color: Colors.teal[50],
                                  borderRadius: BorderRadius.circular(20),
                              
                                ),
                                
                              ),
                              ),
                               SizedBox(width: 70,),
     
                              PopupMenuButton(
                                
                                onSelected: (value) {
                                                value();
                                              },
                                                  
                                    icon: Icon(Icons.more_horiz),
                                    itemBuilder: (context) => [

                                      PopupMenuItem(
                                        child: Text("delete", textAlign: TextAlign.center,),
                                        value: () {
                                            debugPrint('open Settings');
                                          },
                                                        
                                      ),
                                    
                                      
                                    ]
                                )
                               
                                      
                              ]),
                               SizedBox(height: 10,),

                              
                                      Row(
                                        children:[
                                      Text(location['nama'], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.teal[300])),
                                      Text('@', style: TextStyle(fontSize: 10)),
                                      SelectableText(location['uid'], style: TextStyle(fontSize: 10))

                                      ]
                                      ),
                                      Row(
                                        children: <Widget>[
                                          
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(location['desc']),
                                                  
                                                  SizedBox(height: 30,),
                                                  Row(
                                                    children: [
                                                      Text(location['date'], style: TextStyle(fontSize: 10),), 
                                                      Text('• ', style: TextStyle(fontSize: 10),), 
                                                      Text(location['kawasan'], style: TextStyle(fontSize: 10, color: Colors.teal),)],
                                                      
                                                  ),
                                                  

                                                
                                                  
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                          Column(
                                            
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: <Widget>[
                                              

                                              ElevatedButton(
                                                onPressed: (){
                                                  launch(('tel://${location['tel']}'));
                                                                    },
                                                child: Icon(FontAwesomeIcons.phone, size: 13,),
                                                style: ElevatedButton.styleFrom(

                                                  primary: Colors.red,
                                                  padding: const EdgeInsets.all(3.0),
                                                  minimumSize: Size(50, 35),
                                                ),
                                    
                                                ),

                                          ElevatedButton(
                                                onPressed: (){
                                                  launch(('whatsapp://send?phone=6${location['tel']}&text=Hi, saya dari Sharity App ingin tanya tentang bantuan dari pihak Tuan/Puan...'));
                                                                    },
                                                child: Icon(FontAwesomeIcons.whatsapp, size: 13,),
                                                style: ElevatedButton.styleFrom(

                                                  primary: Colors.green,
                                                  padding: const EdgeInsets.all(3.0),
                                                  minimumSize: Size(50, 35),
                                                ),
                                    
                                                ),
                        
                                  
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                              
                            ]
                          ,);

                            },
                          );
                        },
                        
                        ),
                      )
                  ]),
                )),
          ],
        ),

 
          
          
    //       body: Container (
            
    //         child: Column( children: <Widget>[


    //     Expanded(

    //       child : StreamBuilder(


      
    //         stream: Firestore.instance.collection("location").snapshots(),
    //         builder: (context, snapshot){
       
              
    //           return ListView.builder(
    //             itemCount: snapshot.data.documents.length,
    //             shrinkWrap: true,
    //             itemBuilder: (context, index) {

    //               DocumentSnapshot location = snapshot.data.documents[index];

    //           return ListBody(
                

    //             children: <Widget>[

    //              Container(
                   

    //                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    //                decoration: BoxDecoration( 
         
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(5),
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey,
    //                       blurRadius: 2,
    //                       offset: Offset(0.5, 1), // Shadow position
    //                     ),]
                      
    //                   ),

                        
    //               margin: EdgeInsets.fromLTRB(12, 5, 12, 5),

    //               child: Column(
                   
    //               children: <Widget>[ 

    //                Align(
                     
    //                  alignment: Alignment.topLeft,
    //                  child: Container(
    //                 padding: EdgeInsets.only(top:3),
                  
    //                 width: 100,
    //                 height: 20,
    //                 child: Text(
    //                 "Perlu bantuan🆘", textAlign: TextAlign.center,
                    
    //                 style:
    //                     TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.red),
    //                 ),
           
                    

    //                 decoration: BoxDecoration(
    //                   color: Colors.red[50],
    //                   borderRadius: BorderRadius.circular(20),
                  
    //                 ),
                    
    //               ),
    //                ),

    //               SizedBox(height: 10,),
    //                       Row(
    //                         children:[
    //                       Text(location['nama'], style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Colors.teal[300])),
    //                       Text('@', style: TextStyle(fontSize: 10)),
    //                       SelectableText(location['uid'], style: TextStyle(fontSize: 10))

    //                       ]
    //                       ),
    //                       Row(
    //                         children: <Widget>[
                              
    //                           Expanded(
    //                             child: Padding(
    //                               padding: const EdgeInsets.all(8.0),
    //                               child: Column(
    //                                 crossAxisAlignment: CrossAxisAlignment.start,
    //                                 children: <Widget>[
    //                                   Text(location['desc']),
                                      
    //                                   SizedBox(height: 30,),
    //                                   Row(
    //                                     children: [
    //                                       Text(location['date'], style: TextStyle(fontSize: 10),), 
    //                                       Text('• ', style: TextStyle(fontSize: 10),), 
    //                                       Text(location['kawasan'], style: TextStyle(fontSize: 10, color: Colors.teal),)],
                                          
    //                                   ),
                                      

                                     
                                      
    //                                 ],
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(height: 20,),
    //                           Column(
                                
    //                             crossAxisAlignment: CrossAxisAlignment.end,
    //                             children: <Widget>[

    //                               ElevatedButton(
    //                                 onPressed: (){
    //                                   launch(('tel://${location['tel']}'));
    //                                                     },
    //                                 child: Icon(FontAwesomeIcons.phone, size: 13,),
    //                                 style: ElevatedButton.styleFrom(

    //                                   primary: Colors.red,
    //                                   padding: const EdgeInsets.all(3.0),
    //                                   minimumSize: Size(50, 35),
    //                                 ),
                        
    //                                 ),

    //                            ElevatedButton(
    //                                 onPressed: (){
    //                                   launch(('whatsapp://send?phone=6${location['tel']}&text=Hi, saya dari Sharity App ingin bantu.'));
    //                                                     },
    //                                 child: Icon(FontAwesomeIcons.whatsapp, size: 13,),
    //                                 style: ElevatedButton.styleFrom(

    //                                   primary: Colors.green,
    //                                   padding: const EdgeInsets.all(3.0),
    //                                   minimumSize: Size(50, 35),
    //                                 ),
                        
    //                                 ),
             
                      
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   )
    //               ),
                  
    //             ]
    //           ,);

    //             },
    //            );
    //         },
            
    //         ),
    //       )
    //   ]),
    // )

            
            
           
          
      
    ),
    );
  }
}

