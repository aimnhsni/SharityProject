import 'package:flutter/material.dart';
import 'package:sharity_app/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class forecastChart extends StatefulWidget {
  

  @override
  _forecastChartState createState() => _forecastChartState();
}

class _forecastChartState extends State<forecastChart> {

  TooltipBehavior _tooltipBehavior1;

  final List<ChartData> chartDataForecast = [
        ChartData('1991', 3.665),
        ChartData('1992', 3.71,),
        ChartData('1993', 4.11),
        ChartData('1994', 3.62,),
        ChartData('1995', 3.15),
        ChartData('1996', 2.52,),
        ChartData('1997', 2.45),
        ChartData('1998', 3.2,),
        ChartData('1999', 3.43),
        ChartData('2000', 3,),
        ChartData('2001', 3.53),
        ChartData('2002', 3.48,),
        ChartData('2003', 3.61),
        ChartData('2004', 3.54,),
        ChartData('2005', 3.53),
        ChartData('2006', 3.32,),
        ChartData('2007', 3.23),
        ChartData('2008', 3.34,),
        ChartData('2009', 3.69),
        ChartData('2010', 3.25,),
        ChartData('2011', 3.05),
        ChartData('2012', 3.04,),
        ChartData('2013', 3.11),
        ChartData('2014', 2.88,),
        ChartData('2015', 3.1),
        ChartData('2016', 3.44,),
        ChartData('2017', 3.41),
        ChartData('2018', 3.35,),
        ChartData('2019', 3.324),
        ChartData('2020', 4.7,),
       
  ];

   final List<ChartData> chartDataForecast2 = [
        ChartData('1991', 3.665),
        ChartData('1992', 3.71,),
        ChartData('1993', 4.11),
        ChartData('1994', 3.62,),
        ChartData('1995', 3.15),
        ChartData('1996', 2.52,),
        ChartData('1997', 2.45),
        ChartData('1998', 3.2,),
        ChartData('1999', 3.43),
        ChartData('2000', 3,),
        ChartData('2001', 3.53),
        ChartData('2002', 3.48,),
        ChartData('2003', 3.61),
        ChartData('2004', 3.54,),
        ChartData('2005', 3.53),
        ChartData('2006', 3.32,),
        ChartData('2007', 3.23),
        ChartData('2008', 3.34,),
        ChartData('2009', 3.69),
        ChartData('2010', 3.25,),
        ChartData('2011', 3.05),
        ChartData('2012', 3.04,),
        ChartData('2013', 3.11),
        ChartData('2014', 2.88,),
        ChartData('2015', 3.1),
        ChartData('2016', 3.44,),
        ChartData('2017', 3.41),
        ChartData('2018', 3.35,),
        ChartData('2019', 3.324),
        ChartData('2020', 4.7,),
        ChartData('2021', 4.8,Colors.yellow),
        ChartData('2022', 4.138,Colors.yellow),
        ChartData('2023', 3.747,Colors.yellow),
        ChartData('2024', 3.494,Colors.yellow),
        ChartData('2025', 3.458,Colors.yellow),
  ];

  @override
  void initState(){
       
 
      _tooltipBehavior1 =  TooltipBehavior(enable: true);
     
     
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
                              
                                width: 340,
                                height: 35,
                                

                                child:Padding(padding: EdgeInsets.only(left: 15), child:Row(children: <Widget>[
                                  Text(
                                "Ramalan Kadar Pengangguran 💼", textAlign: TextAlign.center,
                                
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

                 SizedBox(height: 40,),

            Container(
            width: 350,
            height: 350,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Ramalan Kadar Pengangguran (%)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4),
              //Initialize the spark charts widget
               child: SfCartesianChart(
                 tooltipBehavior: _tooltipBehavior1,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true, position: LegendPosition.bottom,),
                        series: <ChartSeries>[
                           
                         
                             LineSeries<ChartData, String>(
                              name: 'Kadar Ramalan', color: Colors.yellow,
                                dataSource: chartDataForecast2,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y,
                                pointColorMapper:(ChartData sales, _) => sales.color,
                            ),
                               LineSeries<ChartData, String>(
                              name: 'Kadar Semasa', color: Colors.red,
                                dataSource: chartDataForecast,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y,
                                pointColorMapper:(ChartData sales, _) => sales.color,
                            ),
                       
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
       

                  

      
        
        ])
      )
    )
      
    );
  }
}