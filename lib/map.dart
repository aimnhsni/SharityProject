import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sharity_app/Listhelp.dart';


class Map extends StatefulWidget {

  @override
  _MapState createState() => _MapState();
}



class _MapState extends State<Map> {
  
  static const LatLng _center = const LatLng(2.9366883, 101.91114670000002);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  final Set<Marker> allMarkers= {};
  // final Map<MarkerId, Marker> markers = {};
  
  



  GoogleMapController mapController;
  // final Map<MarkerId, Marker> markerss = <MarkerId, Marker>{};
  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Encik Ali',
          snippet: 'Memerlukan makanan asas seperti jagung, tin susu, bawang dan potato',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

    navigateToListHelp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ListHelp()));
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }




    void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


 Widget loadMap(){
   return StreamBuilder(
     stream: Firestore.instance.collection('location').snapshots(),
     builder: (context,snapshot){
       
       if (!snapshot.hasData) return Text('Peta sedang diload'); {
         for (int i = 0; i< snapshot.data.documents.length; i++) {
           
           allMarkers.add( Marker(
              markerId: MarkerId(_lastMapPosition.toString()),
             position: new LatLng(snapshot.data.documents[i]['location'].latitude, snapshot.data.documents[i]['location'].longitude) ,
             icon: BitmapDescriptor.defaultMarker, 
             infoWindow: InfoWindow(
               title: snapshot.data.documents[i]['nama'],
               snippet: snapshot.data.documents[i]['desc']
             )
             
             
             
           ));
         }
         
       }

     },
   );
 }
 
void initMarker(specify, specifyId) async{
  var markerIdVal = specifyId;
  final MarkerId markerId = MarkerId(markerIdVal);
  final Marker marker = Marker(
    markerId: markerId,
    position: LatLng(specify['location'].latitude, specify['location'].longitude),
    infoWindow: InfoWindow(title: 'shop')

  );
  
     setState(() {

      //  markers[markerId]= marker;
  
    });
}

getMarkerData() async{
  Firestore.instance.collection('location').getDocuments().then((myMockData){
    if(myMockData.documents.isNotEmpty){
      for(int i; i<myMockData.documents.length; i++){
        initMarker(
        myMockData.documents[i].data, myMockData.documents[i].documentID);
        
      }
    }

  });

}

void iniState(){
  getMarkerData();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    
    getMarker(){
      return <Marker>[
      Marker(
          markerId: MarkerId('Lokasi bantuan'),
          position: LatLng(2.9366883, 101.91114670000002),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'anonim', snippet: 'perlukan makanan asas untuk kegunaan keluarga') 
          )
          

      ].toSet();
    }

    return Scaffold(
    
    
      
      body: Stack(
          children: <Widget>[
            
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: getMarker(),
              onCameraMove: _onCameraMove,
              myLocationButtonEnabled: true,
            ),
 
          
          
            
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    SizedBox(height: 30.0),                    
                    FloatingActionButton(
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.teal,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                  
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      
                      onPressed: navigateToListHelp,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.teal,
                      child: const Icon(Icons.list_sharp, size: 36.0),
                     
                      
                    ),
             
                   

                  
                  ],
                ),
                
              ),
            ),

            
    

          ],
        ),
    );
  
  }


}