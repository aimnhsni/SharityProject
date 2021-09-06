import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:sharity_app/twitter.dart';
import 'package:sharity_app/openData.dart';
import 'package:sharity_app/SharityApp.dart';
import 'package:sharity_app/dataGomen.dart';
import 'package:sharity_app/forecasting.dart';

class Dashboard extends StatefulWidget {


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   TooltipBehavior _tooltipBehavior;


  twitter() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Twitter()));
  }

  openData() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OpenData()));
  }

  sharitySentiment() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Sentimen()));
  }
 openDataGomen() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => dataGomen()));
  }
   forecast() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => forecastChart()));
  }



  final List<ChartData> chartData = [
            ChartData('positive', 100,),
            ChartData('Negative', 400),
            ChartData('Neutral', 600),
            ChartData('hellol', 700),
            ChartData('woi', 800),
            
        ];
          final List<ChartData> chartData2 = [
            ChartData('positive', 30),
            ChartData('Negative', 60),
            ChartData('Neutral', 10),
            
        ];

  @override
  
    void initState(){
      _tooltipBehavior =  TooltipBehavior(enable: true);
      super.initState(); 
    }




  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(


      //   elevation: 0,
      //   title:  Image.asset('images/sharity.jpeg', fit: BoxFit.cover, height: 50,),
      //   centerTitle: true,
      //   flexibleSpace: Container(
          
      //     child: Image.network('https://previews.123rf.com/images/bloomua/bloomua1601/bloomua160100018/50568715-modern-line-icons-seamless-pattern-texture-of-infographics-charts-and-graphs-business-diagram-succes.jpg', fit: BoxFit.cover,),
      //   ),
        
      // ),
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

        body:SingleChildScrollView(child: Center(child: Column(children:<Widget> [
          //Initialize the chart widget
          SizedBox(height: 40.0),

          Container(
                  
                  padding: EdgeInsets.only(top:3),
                              
                                width: 330,
                                height: 35,
                                child: Text(
                                "Sharity Project 📊", textAlign: TextAlign.center,
                                
                                style:
                                    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'karla', color: Colors.teal),
                                ),
                      
                                

                                decoration: BoxDecoration(
                                  color: Colors.teal[50],
                                  borderRadius: BorderRadius.circular(20),
                              
                                ),
                ),
          SizedBox(height: 40.0),   
          
          Container(
            width: 350,
            height: 470,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
            Text('Sentimen Pengguna terhadap Aplikasi Sharity', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),
          
                  
             Padding(
              
              padding: const EdgeInsets.all(4.0),
            
              //Initialize the spark charts widget
          child: SfRadialGauge(
         
          
          axes: <RadialAxis>[
            
            RadialAxis(showLabels: false, showAxisLine: false, showTicks: false,
                      minimum: 0, maximum: 99, 
                      ranges: <GaugeRange>[GaugeRange(startValue: 0, endValue: 33,
                          color: Colors.teal[50], label: 'Negative 😡',
                          sizeUnit: GaugeSizeUnit.factor,
                          labelStyle: GaugeTextStyle(fontFamily: 'karla', fontSize:  20, color: Colors.red),
                          startWidth: 0.35, endWidth: 0.35
                      ),GaugeRange(startValue: 33, endValue: 66,
                        color:Colors.teal[100], label: 'Neutral 😐',
                        labelStyle: GaugeTextStyle(fontFamily: 'karla', fontSize:   20, color: Colors.yellow[900]),
                        startWidth: 0.35, endWidth: 0.35, sizeUnit: GaugeSizeUnit.factor,
                      ),
                        GaugeRange(startValue: 66, endValue: 99,
                          color:Colors.teal[200], label: 'Positive 😄',
                          labelStyle: GaugeTextStyle(fontFamily: 'karla', fontSize:   20, color: Colors.green[500]),
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.35, endWidth: 0.35,
                        ),

                      ],
                     pointers: <GaugePointer>[NeedlePointer(value: 80, enableAnimation: true, needleColor: Colors.teal, )
                ]
                  ),
                
          ]),

            ),
                  ElevatedButton(onPressed: sharitySentiment, child: Text('klik untuk paparan lanjut   👉'),style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    minimumSize: Size(250, 40),
                    
  
                  ),
                  ),
         
            
            ]),

            

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
     

          SizedBox(height: 40.0),

                ElevatedButton.icon(onPressed: openDataGomen, 
                 
                 label:  Text('Analisis Data Terbuka  👉', style: TextStyle(color: Colors.teal),), 
                 icon: Icon(Icons.stacked_bar_chart_outlined,
                 color: Colors.teal,), 
                 style: ElevatedButton.styleFrom(primary: Colors.white,
                    minimumSize: Size(350, 50),)),

                    SizedBox(height: 20.0),



               ElevatedButton.icon(onPressed: twitter, 
                 label:  Text('Analisis Media Sosial   👉', style: TextStyle(color: Colors.teal),), 
                 icon: Icon(FontAwesomeIcons.mobile,
                 color: Colors.teal,), 
                 style: ElevatedButton.styleFrom(primary: Colors.white,
                    minimumSize: Size(350, 50),)),
                SizedBox(height: 20.0),
                
                ElevatedButton.icon(onPressed: openData, 
                 
                 label:  Text('Analisis Data Berstruktur  👉', style: TextStyle(color: Colors.teal),), 
                 icon: Icon(FontAwesomeIcons.database,
                 color: Colors.teal,), 
                 style: ElevatedButton.styleFrom(primary: Colors.white,
                    minimumSize: Size(350, 50),)),

                SizedBox(height: 20.0),

          

                ElevatedButton.icon(onPressed: forecast, 
                 
                 label:  Text('Ramalan Kadar Pengangguran 👉', style: TextStyle(color: Colors.teal),), 
                 icon: Icon(Icons.stacked_line_chart_rounded,
                 color: Colors.teal,), 
                 style: ElevatedButton.styleFrom(primary: Colors.white,
                    minimumSize: Size(350, 50),)),
                 

          SizedBox(height: 40.0),
        ])))
        );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

    class ChartData {
        ChartData(this.x, this.y, [this.color]);
        final String x;
        final double y;
        final Color color;
    }