import 'package:flutter/material.dart';
import 'package:sharity_app/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class Sentimen extends StatefulWidget {
  

  @override
  _SentimenState createState() => _SentimenState();
}

class _SentimenState extends State<Sentimen> {

  TooltipBehavior _tooltipBehavior;
  TooltipBehavior _tooltipBehavior2;
   final List<ChartData> chartData = [

        ChartData('Positif', 71, Colors.green),
        ChartData('Negatif', 10, Colors.redAccent),
        ChartData('Neutral', 19, Colors.amber),

   ];

    final List<ChartData> chartDataSharing = [

        ChartData('Feedback', 15, Colors.green),
        ChartData('Report', 7, Colors.redAccent),
       

   ];

  @override
     void initState(){
       
 
      _tooltipBehavior =  TooltipBehavior(enable: true);
      _tooltipBehavior2 =  TooltipBehavior(enable: true);

      super.initState(); 
    }


  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Container(
          child: Image.network('https://previews.123rf.com/images/bloomua/bloomua1601/bloomua160100018/50568715-modern-line-icons-seamless-pattern-texture-of-infographics-charts-and-graphs-business-diagram-succes.jpg', fit: BoxFit.cover,),
        ),

      ),

      body:SingleChildScrollView(child: Center(child: Column(children:<Widget> [
          //Initialize the chart widget
          SizedBox(height: 40.0),


          Container(
                  
                  padding: EdgeInsets.only(top:3),
                              
                                width: 290,
                                height: 35,
                                

                                child:Padding(padding: EdgeInsets.only(left: 15), child:Row(children: <Widget>[
                                  Text(
                                "Analisis Aplikasi Sharity 🔍", textAlign: TextAlign.center,
                                
                                style:
                                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'karla', color: Colors.teal),
                                ),
                                SizedBox(width: 10,),
                               
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
            width: 350,
            height: 740,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Sentimen Pengguna terhadap Aplikasi Sharity(%)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(2.0),
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
                

             Text('Trend Perbualan Komuniti Sharity', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),
              SizedBox(height: 20,),
              Image.asset('images/wc2.jpeg',width: 370,height: 270),
          
                  
            
         
            
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
              Text('Perkongsian Komuniti Sharity', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior2,
                       primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            // Render pie chart
                            ColumnSeries<ChartData, String>(
                                name: 'Perkongsian',
                                dataSource: chartDataSharing,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                 dataLabelSettings:DataLabelSettings(isVisible : true),
                                 borderRadius: BorderRadius.all(Radius.circular(15)),
                                 width: 0.2,
                                 spacing: 0.1
                                 
                                 
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

           SizedBox(height: 40,),
       

                  

      
        
        ])
      )
    )
      
    );
  }
}