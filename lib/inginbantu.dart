

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sharity_app/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sharity_app/Listhelp.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';

class Helper extends StatefulWidget {
  @override
  _HelperState createState() => _HelperState();
}


class _HelperState extends State<Helper> {
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User user;
  bool isloggedin = false;

  LocationData _currentPosition;
  String _address,_dateTime, _tempat;
  GoogleMapController mapController;
  Marker marker;
  Location location = Location();
  CrudMethods crudMethods = new CrudMethods();

  String _butiran, _nama, uid, _tel;
  String _chosenValue;

  GoogleMapController _controller;
  LatLng _initialcameraposition = LatLng(2.9198, 101.7809);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoc();
    this.checkAuthentification();
    this.getUser();
    
  }




  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _controller;
    location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
        ),
      );
    });
  }

  hantar() async{

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try{
            databaseRef.push().set({'lokasi': _currentPosition, 'butiran': _butiran});

      }
      catch (e) {
        showError(e.message);
        print(e);
      }


    }
    
    }
     uploadHelp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      /// uploading image to firebase storage
 

      Map<String, String> DataHelper = {

        "uid": '${user.uid}',
        'location': '${_initialcameraposition}',
        "nama": _nama, 
        "kawasan": _tempat,
        "desc": _butiran,
        "date": _dateTime,
        "tel": _tel,
        "cat": _chosenValue,

  
      };

      if (_tempat == null) {

            showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message:
                      "Pastikan lokasi anda diaktifkan!",
                ),
            );
                                  
        }

        else{

      crudMethods.addDataHelper(DataHelper).then((result) {
   
   
       Navigator.pushReplacementNamed(context, "listHelp");
       showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Butiran berjaya disimpan!', style: TextStyle(color: Colors.green),),
            content: Text("Terima kasih atas bantuan yang diberikan 🙏💖"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });

        
      });

      }
      
    } 
    
    else{}
  }

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
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          
          title:  Image.asset('images/sharity.jpeg', fit: BoxFit.cover, height: 50,),
          ),

      body: Container(
        
        decoration: BoxDecoration(

          color: Colors.white,
      
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
          
            color: Colors.white,
            child: Center( 
              child: !isloggedin? AwesomeLoader(
            loaderType: AwesomeLoader.AwesomeLoader3,
            color: Colors.teal,): 
               Column(
                children: [
                  Container(
                    height:  MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(target: _initialcameraposition,
                      zoom: 15),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      myLocationEnabled: true,
                    ),
                    
                  ),
                  SizedBox(height: 20,),

                   Align(
                     
                     alignment: Alignment.topCenter,
                     child: Container(
                    padding: EdgeInsets.only(top:3),
                  
                    width: 100,
                    height: 20,
                    child: Text(
                    "ingin Bantu", textAlign: TextAlign.center,
                    
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, fontFamily: 'karla', color: Colors.green),
                    ),
           
                    

                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(20),
                  
                    ),
                    
                  ),
                   ),

                 
                  Container(
                    width: 300,
                    
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      
                    child:
                      
                      Text('Lokasi Anda: $_address 📍' , style: TextStyle(fontWeight: FontWeight.bold)),
                      

                  ),
                        Container(
                        padding: const EdgeInsets.all(0.0),
                        child: DropdownButton<String>(
                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),

                          items: <String>[
                            'Tunai',
                            'Tempat Tinggal',
                            'Perubatan',
                            'Pendidikan',
                            'Pakaian',
                            'Makanan',
                            'Kaunseling',
                            'Lain-lain'
                            
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "Sila pilih kategori bantuan:",
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
                      SizedBox(height: 20,),

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
                            if (input.isEmpty) return 'Masukkan nama samaran atau sebenar anda';
                          },
                      
                          decoration: InputDecoration(
                                                        
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'anonim',
                            hintStyle: TextStyle(fontSize: 12),
                            labelText: 'Nama Sebenar/Panggilan/Organisasi',
                            labelStyle: TextStyle(
                              color: Colors.teal[300],
                              fontSize: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            
                          ),
                          onSaved: (input) => _nama = input),
                    ),),

                    SizedBox(height: 20,),

                    Container(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 300),
                      child: TextFormField(
                          validator: (input) {
                            if (input.length<10 || input.length>11) return 'Masukkan format No Telefon yang sah';
                          },
                           keyboardType: TextInputType.number,
                           
                      
                          decoration: InputDecoration(
                                                        
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'eg: 0112903991',
                            hintStyle: TextStyle(fontSize: 12),
                            labelText: 'No Telefon',
                            labelStyle: TextStyle(
                              color: Colors.teal[300],
                              fontSize: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            
                          ),
                          onSaved: (input) => _tel = input),
                    ),),

                    
                    SizedBox(height: 20,),
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
                            hintText: 'eg: Saya ada foodbank ingin dikongsi',
                            hintStyle: TextStyle(fontSize: 12),
                            labelText: 'Butiran',
                            labelStyle: TextStyle(
                            color: Colors.teal[300],
                            fontSize: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:BorderSide.none
                              
                            ),
                            
                          ),
                          onSaved: (input) => _butiran = input),
                    ),
                  ),

                    SizedBox(height: 20.0),
                          ElevatedButton(
                            
                            onPressed: uploadHelp, 
                            child: Text('Hantar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontFamily: 'karla'),), 
                            style: ElevatedButton.styleFrom(

                              primary: Colors.teal[300],
                            
                              minimumSize: Size(100, 35),
                            ),
                
                            ),
                            SizedBox(height: 20,),
     

                  ],
                ),

              ),
            ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // if (_dateTime != null)
                  //   Text(
                  //     "Date/Time: $_dateTime",
                  //     style: TextStyle(
                  //         fontSize: 15,
                  //         color: Colors.white,
                  //       ),
                  //   ),

                  // SizedBox(
                  //   height: 3,
                  // ),
                  // if (_currentPosition != null)
                  //   Text(
                  //     "Latitude: ${_currentPosition.latitude}, Longitude: ${_currentPosition.longitude}",
                  //     style: TextStyle(
                  //         fontSize: 22,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // if (_address != null)
                  //   Text(
                  //     "Address: $_address",
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                ],
              ),
              
            ),
          ),
          
        ),
        
      ),
      

    );
  }


   getLoc() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    _initialcameraposition = LatLng(_currentPosition.latitude,_currentPosition.longitude);
    location.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.longitude} : ${currentLocation.longitude}");
      setState(() {
        _currentPosition = currentLocation;
        _initialcameraposition = LatLng(_currentPosition.latitude,_currentPosition.longitude);

        DateTime now = DateTime.now();
        _dateTime = DateFormat('kk:mm a • MMM d, yyyy').format(now);
        _getAddress(_currentPosition.latitude, _currentPosition.longitude)
            .then((value) {
          setState(() {
            _address = "${value.first.addressLine}";
            _tempat = "${value.first.locality}";
  
          
          });
        });
      });
    });
  }


  Future<List<Address>> _getAddress(double lat, double lang) async {
    final coordinates = new Coordinates(lat, lang);
    List<Address> add =
    await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }

}

