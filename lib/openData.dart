import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharity_app/dashboard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

   class AdaptiveTextSize {
      const AdaptiveTextSize();

      getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
        return (value / 720) * MediaQuery.of(context).size.height;
      }
    }

class OpenData extends StatefulWidget {
  

  @override
  _OpenDataState createState() => _OpenDataState();
}

class _OpenDataState extends State<OpenData> {
TooltipBehavior _tooltipBehavior2;
TooltipBehavior _tooltipBehavior1;
TooltipBehavior _tooltipBehavior3;
TooltipBehavior _tooltipBehavior4;
TooltipBehavior _tooltipBehavior5;
TooltipBehavior _tooltipBehavior6;
TooltipBehavior _tooltipBehavior7;


final List<ChartData> chartDaerah = [


            ChartData('Kuala Selangor', 1577, Colors.teal[50]),
            ChartData('Petaling', 1486,Colors.teal[100]),
            ChartData('Sabak Bernam', 1351, Colors.teal[200]),
            ChartData('Klang', 1153,Colors.teal[300]),
            ChartData('Hulu Langat', 1071,Colors.teal[400]),
            ChartData('Hulu Selangor', 982,Colors.teal[500]),
            ChartData('Gombak', 959,Colors.teal[600]),
            ChartData('Kuala Langat', 690,Colors.teal[700]),
            ChartData('Sepang', 479,Colors.teal[800]),
           
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

final List<ChartData> chartDataEtnik = [


            ChartData('Melayu', 33.3, Colors.blue),
            ChartData('Cina', 3.1,Colors.blue),
            ChartData('India', 9.8,Colors.blue),
            ChartData('Iban', 0.0,Colors.blue),
            ChartData('Bajau', 0.0,Colors.blue),
          
];

final List<ChartData> chartDataEtnik2 = [


            ChartData('Melayu',39, Colors.pink),
            ChartData('Cina', 2.5, Colors.pink),
            ChartData('India', 12.2, Colors.pink),
            ChartData('Iban', 0, Colors.pink),
            ChartData('Bajau', 0, Colors.pink),
          
];

final List<ChartData> chartDataSijil = [


            ChartData('Tiada Sijil', 5818, Colors.teal[50]),
            ChartData('SRP/PMR?LCE', 1270,Colors.teal[100]),
            ChartData('SPM/SPVM', 1240, Colors.teal[200]),
            ChartData('UPSR', 1228,Colors.teal[300]),
            ChartData('STPM/Diploma', 106 ,Colors.teal[400]),
            ChartData('Sijil Kemahiran', 35,Colors.teal[500]),
            ChartData('Ijazah', 20,Colors.teal[600]),
        
           
];

final List<ChartData> chartDataStatus = [


            ChartData('Bujang',7.3, Colors.green),
            ChartData('Berkahwin', 42.3, Colors.amber),
            ChartData('Bercerai/Berpisah', 50.4, Colors.teal),
           
          
];

final List<ChartData> chartJenisBantuan = [


            ChartData('Makanan', 39.8, Colors.teal[50]),
            ChartData('Tunai', 26.9,Colors.teal[100]),
            ChartData('Tempat Tinggal', 12.9, Colors.teal[200]),
            ChartData('Perubatan', 8.4,Colors.teal[300]),
            ChartData('Pakaian', 6.0,Colors.teal[400]),
            ChartData('Pendidikan', 3.2,Colors.teal[500]),
            ChartData('Kauseling', 2.8,Colors.teal[600]),
            
];

final List<ChartData> chartJumlahBantuan = [


            ChartData('Januari',24600, Colors.teal[50]),
            ChartData('Februari', 600,Colors.teal[100]),
            ChartData('Mac', 1450, Colors.teal[200]),
            ChartData('April', 7650,Colors.teal[300]),
            ChartData('May', 45350,Colors.teal[400]),
            ChartData('Jun', 10250,Colors.teal[500]),
            ChartData('Julai', 20350,Colors.teal[600]),
            
];

final List<ChartData> chartJumlahBantuan2 = [


            ChartData('Januari',51, Colors.teal[50]),
            ChartData('Februari', 5,Colors.teal[100]),
            ChartData('Mac', 5, Colors.teal[200]),
            ChartData('April', 22,Colors.teal[300]),
            ChartData('May', 91,Colors.teal[400]),
            ChartData('Jun', 18,Colors.teal[500]),
            ChartData('Julai', 57,Colors.teal[600]),
            
];




  @override
  
   void initState(){
       
 
      _tooltipBehavior1 =  TooltipBehavior(enable: true);
      _tooltipBehavior2 =  TooltipBehavior(enable: true);
      _tooltipBehavior3 =  TooltipBehavior(enable: true);
      _tooltipBehavior4 =  TooltipBehavior(enable: true);
      _tooltipBehavior5 =  TooltipBehavior(enable: true);
      _tooltipBehavior6 =  TooltipBehavior(enable: true);
      _tooltipBehavior7 =  TooltipBehavior(enable: true);
     
      super.initState(); 
    }



  Widget build(BuildContext context) {
        return DefaultTabController(
      length: 2,
      child: Scaffold(

      appBar: AppBar(
          backgroundColor: Colors.white,
          
          title:    Align(
                     
                     
                     child: Container(
                       child: FlatButton(
                          color: Colors.teal[50],
                              child: Text('Analisis Data Berstruktur ',style: TextStyle(color: Colors.teal, fontSize: 17,fontWeight: FontWeight.bold),),
                              onPressed: (){},
                                shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(30.0),    ), 
                                
                       ),
                  ),
                 ),
                 
          flexibleSpace: Container(
          child: Image.network('https://img.freepik.com/free-vector/charity-doodle-vector-people-donating-things_53876-126415.jpg?size=626&ext=jpg', fit: BoxFit.cover,),
        ),
          bottom: TabBar(
          indicatorColor: Colors.teal,
          indicatorSize: TabBarIndicatorSize.label,  
          
   
           tabs: [
              Tab(    child: Container(
                       child: FlatButton(
                          color: Colors.teal[50],
                              child: Text('Analisis Permohonan ',style: TextStyle(color: Colors.teal, fontSize: 12,fontWeight: FontWeight.bold),),
                              onPressed: (){},
                                shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(30.0),    ), 
                                
                       ),
                  ),),
              Tab( child: Container(
                       child: FlatButton(
                          color: Colors.teal[50],
                              child: Text('Analisis Bantuan ',style: TextStyle(color: Colors.teal, fontSize: 12,fontWeight: FontWeight.bold),),
                              onPressed: (){},
                                shape: new RoundedRectangleBorder(      borderRadius: new BorderRadius.circular(30.0),    ), 
                                
                       ),
                  ),),
          ],),
        
          ),
          body: TabBarView(
          children: [SingleChildScrollView(child:
            Center(child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Container(
                height: 250,
                width: 350,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          _buildStatCard('Bilangan Permohonan', '9728', Colors.teal),
                          _buildStatCard('OKU Berdaftar', '616 (6.3%)', Colors.lightGreen),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          _buildStatCard('Purata Ahli Isi Rumah', '3', Colors.amber),
                          _buildStatCard('Purata Pendapatan Sebulan', 'RM 1224', Colors.pink),
                          
                          
                          
                        ],
                      ),
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
              Text('Permohonan Mengikut Daerah - (Selangor)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior1,
                       primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            // Render pie chart
                            ColumnSeries<ChartData, String>(
                                name: 'Daerah',
                                dataSource: chartDaerah,
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
          SizedBox(height: 40,),

          Container(
            width: 350,
            height: 350,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Bilangan Pemohon mengikut Etnik & Jantina (%)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4),
              //Initialize the spark charts widget
                child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehavior2,
                        primaryXAxis: CategoryAxis(),
                        legend: Legend(isVisible: true, position: LegendPosition.bottom,),
                        series: <ChartSeries>[
                             
                            StackedColumn100Series<ChartData, String>(
                                name: 'Lelaki',
                                dataSource: chartDataEtnik,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelSettings:DataLabelSettings(isVisible : true),
                                width: 0.8, // Width of the columns
                                spacing: 0.2 // Spacing between the columns
                            ),
                            StackedColumn100Series<ChartData, String>(
                                name:'Perempuan',
                                dataSource: chartDataEtnik2,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelSettings:DataLabelSettings(isVisible : true),
                                width: 0.8, // Width of the columns
                                spacing: 0.2 // Spacing between the columns
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
              Text('Bilangan Pemohon dengan Sijil Tertinggi', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
             child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior3,
                       primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            // Render pie chart
                            BarSeries<ChartData, String>(
                                name: 'Sijil Tertinggi',
                                dataSource: chartDataSijil,
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
          SizedBox(height: 40,),

           Container(
            width: 350,
            height: 350,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Bilangan Pemohon mengikut Status Perkahwinan(%)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal,fontSize: 
                 AdaptiveTextSize().getadaptiveTextSize(context, 12))),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
              child: SfCircularChart(
                tooltipBehavior: _tooltipBehavior4,
                legend: Legend(isVisible: true), 
                        series: <CircularSeries>[
                            // Render pie chart
                            PieSeries<ChartData, String>(
                              
                                dataSource: chartDataStatus,
                                pointColorMapper:(ChartData data,  _) => data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelSettings:DataLabelSettings(isVisible : true)
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

            ],))  ),


    //inginbantu tab view page


          SingleChildScrollView(child:  Center( child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Container(
                height: 250,
                width: 350,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          _buildStatCard('BIlangan Agihan Bantuan', '249', Colors.teal),
                          _buildStatCard('Jumlah Agihan Bantuan (MYR)', 'RM 110,150', Colors.lightBlue),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          _buildStatCard('Bilangan Program Bantuan', '55', Colors.green),
                          _buildStatCard('Jumlah Agihan Bantuan dalam bentuk Tunai', 'RM 70,600', Colors.amber),
                        
                          
                          
                        ],
                      ),
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
              Text('Agihan Jenis Bantuan (%)', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior5,
                       primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                            // Render pie chart
                            ColumnSeries<ChartData, String>(
                                name: 'Jenis Bantuan',
                                dataSource: chartJenisBantuan,
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

          SizedBox(height: 40,),

          Container(
            width: 350,
            height: 350,

            child:Column(children: <Widget>[
              SizedBox(height: 20,),
              Text('Jumlah & Nilai Bantuan Mengikut Bulan', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal)),

              Padding(
              padding: const EdgeInsets.all(4.0),
              //Initialize the spark charts widget
               child: SfCartesianChart(
                 tooltipBehavior: _tooltipBehavior6,
                 legend: Legend(isVisible: true, position: LegendPosition.bottom,),
                        primaryXAxis: CategoryAxis(),
                        series: <CartesianSeries>[
                            // Render column series
                            ColumnSeries<ChartData, String>(
                                name: 'Nilai Bantuan',
                                dataSource: chartJumlahBantuan,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y
                            ),
                            // Render line series
                            ColumnSeries<ChartData, String>(
                                name: 'Jumlah Bantuan',
                                dataSource: chartJumlahBantuan2,
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
            ],) ),)
          ],
        ),

    ),
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

 