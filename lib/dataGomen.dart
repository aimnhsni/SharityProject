import 'package:flutter/material.dart';
import 'package:sharity_app/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class dataGomen extends StatefulWidget {
 

  @override
  _dataGomenState createState() => _dataGomenState();
}

class _dataGomenState extends State<dataGomen> {
  TooltipBehavior _tooltipBehavior1;
  TooltipBehavior _tooltipBehavior2;
  TooltipBehavior _tooltipBehavior3;
   TooltipBehavior _tooltipBehavior4;


final List<ChartData> chartDataBPT= [

            ChartData('Kuala Selangor', 1049, Colors.teal[50]),
            ChartData('Petaling', 682,Colors.teal[100]),
            ChartData('Sabak Bernam',814, Colors.teal[200]),
            ChartData('Klang', 1724,Colors.teal[300]),
            ChartData('Hulu Langat', 1199,Colors.teal[400]),
            ChartData('Hulu Selangor', 674,Colors.teal[500]),
            ChartData('Gombak', 1003,Colors.teal[600]),
            ChartData('Kuala Langat', 649,Colors.teal[700]),
            ChartData('Sepang', 393,Colors.teal[800]),
            ChartData('Shah Alam', 625,Colors.teal[800]),
            ChartData('Subang Jaya', 458,Colors.teal[800]),

];

final List<ChartData> chartDataBOT= [

            ChartData('Kuala Selangor', 1821, Colors.teal[50]),
            ChartData('Petaling', 3623,Colors.teal[100]),
            ChartData('Sabak Bernam',5303, Colors.teal[200]),
            ChartData('Klang', 7358,Colors.teal[300]),
            ChartData('Hulu Langat', 5732,Colors.teal[400]),
            ChartData('Hulu Selangor', 7306,Colors.teal[500]),
            ChartData('Gombak', 4455,Colors.teal[600]),
            ChartData('Kuala Langat', 4182,Colors.teal[700]),
            ChartData('Sepang', 1072,Colors.teal[800]),
            ChartData('Shah Alam', 2044,Colors.teal[800]),
            ChartData('Subang Jaya', 2626,Colors.teal[800]),

];

final List<ChartData> chartDataBTB= [

            ChartData('Kuala Selangor', 1613, Colors.teal[50]),
            ChartData('Petaling', 2204,Colors.teal[100]),
            ChartData('Sabak Bernam',1244, Colors.teal[200]),
            ChartData('Klang', 3690,Colors.teal[300]),
            ChartData('Hulu Langat', 2566,Colors.teal[400]),
            ChartData('Hulu Selangor', 1629,Colors.teal[500]),
            ChartData('Gombak', 2414,Colors.teal[600]),
            ChartData('Kuala Langat', 1258,Colors.teal[700]),
            ChartData('Sepang', 694,Colors.teal[800]),
            ChartData('Shah Alam', 1086,Colors.teal[800]),
            ChartData('Subang Jaya', 1495,Colors.teal[800]),

];

final List<ChartData> chartDataBKK= [

            ChartData('Kuala Selangor', 1609, Colors.teal[50]),
            ChartData('Petaling', 2694,Colors.teal[100]),
            ChartData('Sabak Bernam',1572, Colors.teal[200]),
            ChartData('Klang', 6326,Colors.teal[300]),
            ChartData('Hulu Langat', 4706,Colors.teal[400]),
            ChartData('Hulu Selangor', 5684,Colors.teal[500]),
            ChartData('Gombak', 3645,Colors.teal[600]),
            ChartData('Kuala Langat', 2351,Colors.teal[700]),
            ChartData('Sepang', 1523,Colors.teal[800]),
            ChartData('Shah Alam', 1588,Colors.teal[800]),
            ChartData('Subang Jaya', 1429,Colors.teal[800]),

];
final List<ChartData> chartDataBAP= [

            ChartData('Kuala Selangor', 50, Colors.teal[50]),
            ChartData('Petaling', 50,Colors.teal[100]),
            ChartData('Sabak Bernam',50, Colors.teal[200]),
            ChartData('Klang', 21,Colors.teal[300]),
            ChartData('Hulu Langat', 50,Colors.teal[400]),
            ChartData('Hulu Selangor', 50,Colors.teal[500]),
            ChartData('Gombak', 50,Colors.teal[600]),
            ChartData('Kuala Langat', 50,Colors.teal[700]),
            ChartData('Sepang', 50,Colors.teal[800]),
            ChartData('Shah Alam', 50,Colors.teal[800]),
            ChartData('Subang Jaya', 50,Colors.teal[800]),

];
final List<ChartData> chartDataBLA= [

            ChartData('Kuala Selangor', 24, Colors.teal[50]),
            ChartData('Petaling', 2,Colors.teal[100]),
            ChartData('Sabak Bernam',9, Colors.teal[200]),
            ChartData('Klang', 22,Colors.teal[300]),
            ChartData('Hulu Langat', 4,Colors.teal[400]),
            ChartData('Hulu Selangor', 25,Colors.teal[500]),
            ChartData('Gombak', 1,Colors.teal[600]),
            ChartData('Kuala Langat', 5,Colors.teal[700]),
            ChartData('Sepang', 0,Colors.teal[800]),
            ChartData('Shah Alam', 14,Colors.teal[800]),
            ChartData('Subang Jaya', 11,Colors.teal[800]),

];

final List<ChartData> chartDataBAN= [

            ChartData('Kuala Selangor', 3339, Colors.teal[50]),
            ChartData('Petaling', 1882,Colors.teal[100]),
            ChartData('Sabak Bernam',2038, Colors.teal[200]),
            ChartData('Klang', 4717,Colors.teal[300]),
            ChartData('Hulu Langat', 2779,Colors.teal[400]),
            ChartData('Hulu Selangor', 4171,Colors.teal[500]),
            ChartData('Gombak', 3139,Colors.teal[600]),
            ChartData('Kuala Langat', 3487,Colors.teal[700]),
            ChartData('Sepang', 2650,Colors.teal[800]),
            ChartData('Shah Alam', 784,Colors.teal[800]),
            ChartData('Subang Jaya', 1151,Colors.teal[800]),

];

//BANTUAN BY KAUM

final List<ChartData> chartKaumBPT= [

            ChartData('Melayu', 1049, Colors.teal[50]),
            ChartData('India', 682,Colors.teal[100]),
            ChartData('Cina',814, Colors.teal[200]),
            ChartData('Peribumi Semenanjung', 1724,Colors.teal[300]),
            ChartData('Lain-Lain', 1199,Colors.teal[400]),
            ChartData('Peribumi Sabah', 674,Colors.teal[500]),
            ChartData('Peribumi Sarawak', 1003,Colors.teal[600]),
  

];

final List<ChartData> chartKaumBOT= [

            ChartData('Melayu', 1821, Colors.teal[50]),
            ChartData('India', 3623,Colors.teal[100]),
            ChartData('Cina',5303, Colors.teal[200]),
            ChartData('Peribumi Semenanjung', 7358,Colors.teal[300]),
            ChartData('Lain-Lain', 5732,Colors.teal[400]),
            ChartData('Peribumi Sabah', 7306,Colors.teal[500]),
            ChartData('Peribumi Sarawak', 4455,Colors.teal[600]),


];

final List<ChartData> chartKaumBTB= [

            ChartData('Melayu', 1613, Colors.teal[50]),
            ChartData('India', 2204,Colors.teal[100]),
            ChartData('Cina',1244, Colors.teal[200]),
            ChartData('Peribumi Semenanjung', 3690,Colors.teal[300]),
            ChartData('Lain-Lain', 2566,Colors.teal[400]),
            ChartData('Peribumi Sabah', 1629,Colors.teal[500]),
            ChartData('Peribumi Sarawak', 2414,Colors.teal[600]),


];

final List<ChartData> chartKaumBKK= [

            ChartData('Melayu', 1609, Colors.teal[50]),
            ChartData('India', 2694,Colors.teal[100]),
            ChartData('Cina',1572, Colors.teal[200]),
            ChartData('Peribumi Semenanjung', 6326,Colors.teal[300]),
            ChartData('Lain-Lain', 4706,Colors.teal[400]),
            ChartData('Peribumi Sabah', 5684,Colors.teal[500]),
            ChartData('Peribumi Sarawak', 3645,Colors.teal[600]),


];
final List<ChartData> chartKaumBAP= [

            ChartData('Melayu', 50, Colors.teal[50]),
            ChartData('India', 50,Colors.teal[100]),
            ChartData('Cina',50, Colors.teal[200]),
            ChartData('Peribumi Semenanjung', 21,Colors.teal[300]),
            ChartData('Lain-Lain', 50,Colors.teal[400]),
            ChartData('Peribumi Sabah', 50,Colors.teal[500]),
            ChartData('Peribumi Sarawak', 50,Colors.teal[600]),
  

];
final List<ChartData> chartKaumBLA= [

            ChartData('Melayu', 24, Colors.teal[50]),
            ChartData('India', 2,Colors.teal[100]),
            ChartData('Cina',9, Colors.teal[200]),
            ChartData('Peribumi Semenanjung', 22,Colors.teal[300]),
            ChartData('Lain-Lain', 4,Colors.teal[400]),
            ChartData('Peribumi Sabah', 25,Colors.teal[500]),
            ChartData('Peribumi Sarawak', 1,Colors.teal[600]),
         

];

final List<ChartData> chartKaumBAN= [

            ChartData('Melayu', 3339, Colors.teal[50]),
            ChartData('India', 1882,Colors.teal[100]),
            ChartData('Cina',2038, Colors.teal[200]),
            ChartData('Peribumi Semenanjung', 4717,Colors.teal[300]),
            ChartData('Lain-Lain', 2779,Colors.teal[400]),
            ChartData('Peribumi Sabah', 4171,Colors.teal[500]),
            ChartData('Peribumi Sarawak', 3139,Colors.teal[600]),


];

//BANTUAN BY TAHUN

final List<ChartData> chartTahunBPT= [

            ChartData('2012', 1049, Colors.teal[50]),
            ChartData('2013', 682,Colors.teal[100]),
            ChartData('2014',814, Colors.teal[200]),
            ChartData('2015', 1724,Colors.teal[300]),
          
  

];

final List<ChartData> chartTahunBOT= [

            ChartData('2012', 1821, Colors.teal[50]),
            ChartData('2013', 3623,Colors.teal[100]),
            ChartData('2014',5303, Colors.teal[200]),
            ChartData('2015', 7358,Colors.teal[300]),



];

final List<ChartData> chartTahunBTB= [

            ChartData('2012', 1613, Colors.teal[50]),
            ChartData('2013', 2204,Colors.teal[100]),
            ChartData('2014',1244, Colors.teal[200]),
            ChartData('2015', 3690,Colors.teal[300]),
   

];

final List<ChartData> chartTahunBKK= [

            ChartData('2012', 1609, Colors.teal[50]),
            ChartData('2013', 2694,Colors.teal[100]),
            ChartData('2014',1572, Colors.teal[200]),
            ChartData('2015', 6326,Colors.teal[300]),
      


];
final List<ChartData> chartTahunBAP= [

            ChartData('2012', 50, Colors.teal[50]),
            ChartData('2013', 50,Colors.teal[100]),
            ChartData('2014',50, Colors.teal[200]),
            ChartData('2015', 21,Colors.teal[300]),


];
final List<ChartData> chartTahunBLA= [

            ChartData('2012', 24, Colors.teal[50]),
            ChartData('2013', 2,Colors.teal[100]),
            ChartData('2014',9, Colors.teal[200]),
            ChartData('2015', 22,Colors.teal[300]),
    

];

final List<ChartData> chartTahunBAN= [

            ChartData('2012', 3339, Colors.teal[50]),
            ChartData('2013', 1882,Colors.teal[100]),
            ChartData('2014',2038, Colors.teal[200]),
            ChartData('2015', 4717,Colors.teal[300]),



];

final List<ChartData> chartKemisikinan1= [

            ChartData('Johor', 126, Colors.teal[50]),
            ChartData('Kedah', 101,Colors.teal[100]),
            ChartData('Kelantan',4365, Colors.teal[200]),
            ChartData('Melaka', 0,Colors.teal[300]),
            ChartData('Negeri Sembilan', 104,Colors.teal[400]),
            ChartData('Pahang', 772,Colors.teal[500]),
            ChartData('Perak', 142,Colors.teal[600]),
            ChartData('Perlis', 3,Colors.teal[700]),
            ChartData('Pulau Pinang', 1487,Colors.teal[800]),
            ChartData('Sabah', 4249,Colors.teal[800]),
            ChartData('Sarawak', 11788,Colors.teal[800]),
            ChartData('Selangor', 2125,Colors.teal[800]),
            ChartData('Terengganu', 31,Colors.teal[800]),
            ChartData('W.P. Kuala Lumpur', 991,Colors.teal[800]),
            ChartData('W.P. Labuan', 235,Colors.teal[800]),
            ChartData('W.P. Putrajaya', 1,Colors.teal[800]),

];

final List<ChartData> chartKemisikinan2= [

            ChartData('Johor', 1805, Colors.teal[50]),
            ChartData('Kedah', 624,Colors.teal[100]),
            ChartData('Kelantan',23751, Colors.teal[200]),
            ChartData('Melaka', 713,Colors.teal[300]),
            ChartData('Negeri Sembilan', 1373,Colors.teal[400]),
            ChartData('Pahang', 2344,Colors.teal[500]),
            ChartData('Perak', 896,Colors.teal[600]),
            ChartData('Perlis', 2729,Colors.teal[700]),
            ChartData('Pulau Pinang', 6586,Colors.teal[800]),
            ChartData('Sabah', 12527,Colors.teal[800]),
            ChartData('Sarawak', 37164,Colors.teal[800]),
            ChartData('Selangor', 8126,Colors.teal[800]),
            ChartData('Terengganu', 3800,Colors.teal[800]),
            ChartData('W.P. Kuala Lumpur', 3765,Colors.teal[800]),
            ChartData('W.P. Labuan', 839,Colors.teal[800]),
            ChartData('W.P. Putrajaya', 14,Colors.teal[800]),

];
  @override
    
   void initState(){
       
 
      _tooltipBehavior1 =  TooltipBehavior(enable: true);
      _tooltipBehavior2 =  TooltipBehavior(enable: true);
      _tooltipBehavior3 =  TooltipBehavior(enable: true);
      _tooltipBehavior4 =  TooltipBehavior(enable: true);
     
     
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
                              
                                width: 280,
                                height: 35,
                                

                                child:Padding(padding: EdgeInsets.only(left: 15), child:Row(children: <Widget>[
                                  Text(
                                "Analisis Data Terbuka 💻", textAlign: TextAlign.center,
                                
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
              Text('Kemiskinan Mengikut Negeri Bagi Ketua Isi Rumah', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
               child: SfCartesianChart(
                 tooltipBehavior: _tooltipBehavior4,
                 legend: Legend(isVisible: true, position: LegendPosition.bottom,),
                        primaryXAxis: CategoryAxis(),
                        series: <CartesianSeries>[
                            // Render column series
                            ColumnSeries<ChartData, String>(
                                name: 'Miskin Tegar',
                                dataSource: chartKemisikinan1,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y
                            ),
                            // Render line series
                            ColumnSeries<ChartData, String>(
                                name: 'Miskin',
                                dataSource: chartKemisikinan2,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y
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

            Container(
            width: 350,
            height: 350,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Bantuan JKM Negeri Selangor Mengikut Daerah', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4),
              //Initialize the spark charts widget
               child: SfCartesianChart(
                 tooltipBehavior: _tooltipBehavior1,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true, position: LegendPosition.bottom,),
                        series: <ChartSeries>[
                            StackedColumnSeries<ChartData, String>(
                              name: 'Bantuan Penjagaan OKU',
                                dataSource: chartDataBPT,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                            StackedColumnSeries<ChartData, String>(
                              name: 'Bantuan Orang Tua',
                                dataSource: chartDataBOT,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedColumnSeries<ChartData, String>(
                               name: 'Bantuan OKU',
                                dataSource: chartDataBTB,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                            StackedColumnSeries<ChartData, String>(
                              name: 'Bantuan Kanak Kanak',
                                dataSource: chartDataBKK,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedColumnSeries<ChartData, String>(
                               name: 'Bantuan Anak Pelihara',
                                dataSource: chartDataBAP,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedColumnSeries<ChartData, String>(
                               name: 'Bantuan Latilhan Aperantis',
                                dataSource: chartDataBLA,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedColumnSeries<ChartData, String>(
                               name: 'Bantuan Am Negeri',
                                dataSource: chartDataBAN,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
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

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Bantuan JKM Negeri Selangor Mengikut Kaum', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4),
              //Initialize the spark charts widget
               child: SfCartesianChart(
                 tooltipBehavior: _tooltipBehavior2,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true, position: LegendPosition.bottom,),
                        series: <ChartSeries>[
                            StackedLineSeries<ChartData, String>(
                              name: 'Bantuan Penjagaan OKU',
                                dataSource: chartKaumBPT,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                            StackedLineSeries<ChartData, String>(
                              name: 'Bantuan Orang Tua',
                                dataSource: chartKaumBOT,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedLineSeries<ChartData, String>(
                               name: 'Bantuan OKU',
                                dataSource: chartKaumBTB,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                            StackedLineSeries<ChartData, String>(
                              name: 'Bantuan Kanak Kanak',
                                dataSource: chartKaumBKK,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedLineSeries<ChartData, String>(
                               name: 'Bantuan Anak Pelihara',
                                dataSource: chartKaumBAP,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedLineSeries<ChartData, String>(
                               name: 'Bantuan Latilhan Aperantis',
                                dataSource: chartKaumBLA,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedLineSeries<ChartData, String>(
                               name: 'Bantuan Am Negeri',
                                dataSource: chartKaumBAN,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
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

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Bantuan JKM Negeri Selangor Mengikut Tahun', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4),
              //Initialize the spark charts widget
               child: SfCartesianChart(
                 tooltipBehavior: _tooltipBehavior3,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true, position: LegendPosition.bottom,),
                        series: <ChartSeries>[
                            StackedBarSeries<ChartData, String>(
                              name: 'Bantuan Penjagaan OKU',
                                dataSource: chartTahunBPT,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                            StackedBarSeries<ChartData, String>(
                              name: 'Bantuan Orang Tua',
                                dataSource: chartTahunBOT,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedBarSeries<ChartData, String>(
                               name: 'Bantuan OKU',
                                dataSource: chartTahunBTB,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                            StackedBarSeries<ChartData, String>(
                              name: 'Bantuan Kanak Kanak',
                                dataSource: chartTahunBKK,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedBarSeries<ChartData, String>(
                               name: 'Bantuan Anak Pelihara',
                                dataSource: chartTahunBAP,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedBarSeries<ChartData, String>(
                               name: 'Bantuan Latilhan Aperantis',
                                dataSource: chartTahunBLA,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
                            ),
                             StackedBarSeries<ChartData, String>(
                               name: 'Bantuan Am Negeri',
                                dataSource: chartTahunBAN,
                                xValueMapper: (ChartData sales, _) => sales.x,
                                yValueMapper: (ChartData sales, _) => sales.y
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


         
          
          SizedBox(height: 40.0),

   
         

     

         
                 
       
                  
           
           
                      
          
         
          
        
        ])
      )
    )

      
    );
  }
}