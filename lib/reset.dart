import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Reset Password'),),
      body: Column(
        
        children: [
          SizedBox(height: 50,),
           Container(
              height: 200,
            
              child:  
              Image.network("https://pathwayport.com/saasland/images/reset_pass.png"), 
  
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
           child: ConstrainedBox(
                         constraints: BoxConstraints.tightFor(width: 300),
            child:  TextFormField(
              
              validator: (input) {
                            if (input.isEmpty)
                              return 'Minimum 6 karakter';
                          },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                            
                            hintText: 'Masukkan alamat emel anda',
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
                          
               onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                  ElevatedButton(
                  onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  showTopSnackBar(
                          context,
                          CustomSnackBar.success(
                            message:
                                "Permintaan untuk menukar kata laluan dihantar ke alamat emel anda",
                                backgroundColor: Colors.teal,
                          ),
                      );
                      if (_email==null) {

                         showTopSnackBar(
                          context,
                          CustomSnackBar.error(
                            message:
                                "Masukkan alamat email anda",
                                backgroundColor: Colors.teal,
                          ),
                      );

                        
                      }
                },
                  child: Text('Hantar Permintaan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                  style: ElevatedButton.styleFrom(
                    
                    primary: Colors.teal,
                    minimumSize: Size(100, 35),
                  ),
       
                  ),
            

            ],
          ),

        ],),
    );
  }
}