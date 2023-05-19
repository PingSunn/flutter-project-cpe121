import 'package:flutter/material.dart';
import 'package:mybasicapp/RowLine.dart';
import 'package:mybasicapp/RowLine.dart';
import 'package:mybasicapp/models/dataBigWidget.dart';
import 'package:mybasicapp/provider/dataCountIcon.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BigWidget1 extends StatelessWidget {
  
  final VoidCallback function;
  String d1 = "data1";
  final RowLine RLdataMeat = RowLine(type1: 'เนื้อสัตว์',dataLine: DataCount(),);
  final RowLine RLdataRice = RowLine(type1: 'ข้าว',dataLine: DataCount(),);
  final RowLine RLdataVeget = RowLine(type1: 'ผัก',dataLine: DataCount(),);


  final DataCount DataBigWidget;

  BigWidget1({super.key, required this.DataBigWidget, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
        gradient: LinearGradient(
              colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 236, 255, 174)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
        borderRadius: BorderRadius.circular(29),
        boxShadow: [BoxShadow(blurRadius: 20)]
      ),
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('asset/image/1631549281278.png',height: 100,width: 100,),
              Image.asset('asset/image/1631549281278.png',height: 100,width: 100,),
              //Image.asset('assets/image/chevron-left.png'),
            ],
          ),
        ),
        //SizedBox(height: 50,),
        RLdataMeat,
        SizedBox(height: 50,),
        RLdataRice,
        SizedBox(height: 50,),
        RLdataVeget,
        SizedBox(height: 30,),
        Row(
          children: [
            SizedBox(width: 120,),
            Text('data',style: 
            TextStyle(
              fontFamily: 'Twist'
            ),),
            SizedBox(width: 60,),
            Text('data',style: 
            TextStyle(
              fontFamily: 'Twist'
            ),),
            SizedBox(width: 40,),
            Text('รวม(กรัม)',style: 
            TextStyle(
              fontFamily: 'Twist'
            ),)
          ],
        ),

        // Expanded(child: ElevatedButton(
        //                 onPressed: () {

        //                   print(getRLdataMeat());
        //                   print(getRLdataRice());
        //                   print(getRLdataVeget());

        //                   print("Confirm");
        //                 },
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     Text(
        //                       "Confirm",
        //                     ),
        //                   ],
        //                 ),
        //               ), ),

        SizedBox(height: 20,),
        LinearPercentIndicator(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 20.0,
                          percent: 0.5,//ใส่ค่าที่คำนวนออกมาได้ตรงนี้(เป็นทศนิยมนะ)
                          center: Text("50.0%"),//ค่าที่เขียนตรงหลอดpercent *อย่าลบบรรทัด ignore นะ ระวังติด error
                          // ignore: deprecated_member_use 
                          linearStrokeCap: LinearStrokeCap.round,
                          progressColor: Colors.green,
                        ),
      ]),
    );
  }
  int getRLdataMeat(){
    return getBigWidgetdata().data1;
  }
  int getRLdataRice(){
    return getBigWidgetdata().data2;
  }
  int getRLdataVeget(){
    return getBigWidgetdata().data3;
  }
  dataBigWidget getBigWidgetdata(){
    dataBigWidget dataBwg = dataBigWidget(
      data1: RLdataMeat.getdataLine(),
      data2: RLdataRice.getdataLine(),
      data3: RLdataVeget.getdataLine()
    );
    return dataBwg;
  }
}