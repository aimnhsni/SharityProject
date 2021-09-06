import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharity_app/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class Twitter extends StatefulWidget {
 

  @override
  _TwitterState createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {

TooltipBehavior _tooltipBehavior;
TooltipBehavior _tooltipBehavior1;
TooltipBehavior _tooltipBehavior2;
TooltipBehavior _tooltipBehavior3;


final List<ChartData> chartData = [


            ChartData('Positif', 63, Colors.green),
            ChartData('Negatif', 23, Colors.redAccent),
            ChartData('Neutral', 14, Colors.amber),
];

final List<ChartData> chartDataAccuracy = [


            ChartData('K-Nearest Neighbour', 0.4921, Colors.green),
            ChartData('Naive Bayes', 0.5686, Colors.redAccent),
            ChartData('SVM', 0.6327, Colors.amber),
            ChartData('Decision Tree', 0.6704, Colors.amber),
            ChartData('Random Forest', 0.6992, Colors.amber),
];

final List<ChartData> chartDataKeyword = [


            ChartData('benderaputih campaign', 2064, Colors.teal[50]),
            ChartData('free food', 435,Colors.teal[100]),
            ChartData('need help', 398, Colors.teal[200]),
            ChartData('benderaputih rakyatjagarakyat', 396,Colors.teal[300]),
            ChartData('kitajagakita benderaputih', 374,Colors.teal[400]),
            ChartData('want help', 257,Colors.teal[500]),
            ChartData('help people', 224,Colors.teal[600]),
            ChartData('help benderaputih', 218,Colors.teal[700]),
            ChartData('foodbank covid19', 147,Colors.teal[800]),
            ChartData('people need', 105,Colors.teal[900]),
];

final List<ChartData> chartDataWord = [


            ChartData('#benderaputih', 8493, Colors.teal[50]),
            ChartData('#kitajagakita', 1003,Colors.teal[100]),
            ChartData('#rakyatjagarakyat', 804, Colors.teal[200]),
            ChartData('#kerajaangagal', 668,Colors.teal[300]),
            ChartData('#malaysia', 511,Colors.teal[400]),
      
];




  



  @override

   void initState(){
       
 
      _tooltipBehavior =  TooltipBehavior(enable: true);
      _tooltipBehavior1 =  TooltipBehavior(enable: true);
      _tooltipBehavior2 =  TooltipBehavior(enable: true);
      _tooltipBehavior3 =  TooltipBehavior(enable: true);
      super.initState(); 
    }


  
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Container(
          child: Image.network('https://cdn5.vectorstock.com/i/1000x1000/11/99/social-media-doodle-set-vector-33231199.jpg', fit: BoxFit.cover,),
        ),

      ),

       body:SingleChildScrollView(child: Center(child: Column(children:<Widget> [
          //Initialize the chart widget
          SizedBox(height: 40.0),


          Container(
                  
                  padding: EdgeInsets.only(top:3),
                              
                                width: 370,
                                height: 35,
                                

                                child:Padding(padding: EdgeInsets.only(left: 15), child:Row(children: <Widget>[
                                  Text(
                                "Trend Bantuan di Media Sosial", textAlign: TextAlign.center,
                                
                                style:
                                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'karla', color: Colors.teal),
                                ),
                                SizedBox(width: 10,),
                                Icon(FontAwesomeIcons.twitter, color: Colors.teal,size: 13,),
                                Icon(FontAwesomeIcons.instagram, color: Colors.teal,size: 10,),
                                Icon(FontAwesomeIcons.facebook, color: Colors.teal,size: 10,)
                                ]),),
                                
                                // child: Text(
                                // "Tren Bantuan di Twitter", textAlign: TextAlign.center,
                                
                                // style:
                                //     TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, fontFamily: 'karla', color: Colors.teal),
                                // ),
                      
                                

                                decoration: BoxDecoration(
                                  color: Colors.teal[50],
                                  borderRadius: BorderRadius.circular(20),
                              
                                ),
                ),
          SizedBox(height: 40.0),

    Container(
      height: 270,
      width: 350,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Used Hashtag(#):', '#benderaputih #kitajagakita', Colors.teal),
                _buildStatCard('Jumlah Data', '8491', Colors.lightBlue),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Taburan Sentimen Positif:', '5338', Colors.green),
                _buildStatCard('Taburan Sentimen Neutral:', '1208', Colors.amber),
                _buildStatCard('Taburan Sentimen Negatif:', '1945', Colors.red),
                
                
              ],
            ),
          ),
        ],
      ),
    ),   
          

          SizedBox(height: 40,),

          

          Container(
            width: 350,
            height: 700,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Sentimen bantuan/charity di Media Sosial(%)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
              child: SfCircularChart(
                tooltipBehavior: _tooltipBehavior,
                legend: Legend(isVisible: true), 
                        series: <CircularSeries>[
                            // Render pie chart
                            DoughnutSeries<ChartData, String>(
                              
                                dataSource: chartData,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                 dataLabelSettings:DataLabelSettings(isVisible : true)
                            )
                        ]
                    ),
            ),
            Text('Ketepatan Model Ramalan Sentimen(%)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),
                   Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
              child: SfCircularChart(
                tooltipBehavior: _tooltipBehavior1,
                legend: Legend(isVisible: true, position: LegendPosition.bottom), 
                        series: <CircularSeries>[
                            RadialBarSeries<ChartData, String>(
                                maximumValue: 1,
                                radius: '100%',
                                gap: '3%',
                                dataSource: chartDataAccuracy,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelSettings: DataLabelSettings(
                                    // Renders the data label
                                    isVisible: true
                                )
                            )
                        ]
                    )
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

       SizedBox(height: 40,),
       Container(
         
         width: 350,
         height: 350,
         child:

           Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Trend Perbualan dalam "Words Cloud" ', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),
              SizedBox(height: 20,),
              Image.asset('images/wc.jpeg',width: 370,height: 270),


            
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

          SizedBox(height: 40,),

          Container(
            width: 350,
            height: 350,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Kata Kunci Terkerap digunakan - (Top 10)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior2,
                
                       primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            // Render pie chart
                            ColumnSeries<ChartData, String>(
                                name: 'Keywords',
                                dataSource: chartDataKeyword,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                 dataLabelSettings:DataLabelSettings(isVisible : true),
                                 
                            )
                        ]
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

           Container(
            width: 350,
            height: 350,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Hashtag(#) Terkerap digunakan - (Top 5)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
             child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior3,
                       primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            // Render pie chart
                            BarSeries<ChartData, String>(
                                name: 'Hashtags',
                                dataSource: chartDataWord,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                 dataLabelSettings:DataLabelSettings(isVisible : true),
                                  

                            )
                        ]
                    ),
              
              )
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

     

         
                 
       
                  
           
           
                      
          
         
          
        
        ])
      )
    )


      
    );
  }
  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }


}
