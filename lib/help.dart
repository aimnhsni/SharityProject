
import 'package:flutter/material.dart';
import 'package:sharity_app/HomePage.dart';
import 'package:firebase_storage/firebase_storage.dart';


class HelpSeeker extends StatefulWidget {
 

  @override
  _HelpSeekerState createState() => _HelpSeekerState();
}

class _HelpSeekerState extends State<HelpSeeker> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title:  Image.asset('images/sharity.jpeg', fit: BoxFit.cover, height: 50,),
          ),

      body: SingleChildScrollView( child: 
          Column(
              children: <Widget>[
                SizedBox(height: 20.0),

              Container(
              height: 100,
            
              child:   Image.network("https://image.flaticon.com/icons/png/512/172/172256.png"),  
  
            ),

             SizedBox(height: 10.0),
 
                Container(
                  
                  child: Text(
                    "Isi maklumat mengenai bantuan yang diperlukan:", textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'karla'),
                  ),
                ),
               

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
                    width: 300,
                    height: 300,
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                    
                    child: Column(
                      
                      children: <Widget>[
                        Container(
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 300),
                        
                        child: TextFormField(
                          
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Name';
                          },
                      
                          decoration: InputDecoration(
                            hintText: 'eg: Memerlukan bantuan makanan asas',
                            hintStyle: TextStyle(fontSize: 12.0),
                            labelText: 'Isi butiran',
                            
                            

                            
                          ),
                          ),

                          
                          
                        
                        ),
                        
                          ),

                          Container(
                        child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 300),
                        
                        child: TextFormField(
                          
                          validator: (input) {
                            if (input.isEmpty) return 'Enter Name';
                          },
                      
                          decoration: InputDecoration(
                            hintText: 'eg: Bangi',
                            hintStyle: TextStyle(fontSize: 12.0),
                            labelText: 'Lokasi',
                            
                            

                            
                          ),
                          ),

                          
                          
                        
                        ),
                        
                          ),

                          
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: (){}, 
                            child: Text('Hantar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                            style: ElevatedButton.styleFrom(
                            
                              minimumSize: Size(100, 35),
                            ),
                
                            ),
                      ]
                    ),
                  
           
                    

                    decoration: BoxDecoration(
                      color: Colors.white,
                     
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(2, 4), // Shadow position
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: 40.0),


          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                
              ],
            ),

              ],

            
            ),
          
    ),
      
    );
  }
}