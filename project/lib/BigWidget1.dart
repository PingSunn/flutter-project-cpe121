import 'package:flutter/material.dart';
import 'package:mybasicapp/RowLine.dart';
import 'package:mybasicapp/provider/dataCountIcon.dart';

class BigWidget1 extends StatelessWidget {


  final RowLine RLdataMeat = RowLine(type1: 'เนื้อสัตว์', type2: '0',);
  final RowLine RLdataRice = RowLine(type1: 'ข้าว', type2: '0',);
  final RowLine RLdataVeget = RowLine(type1: 'ผัก', type2: '0');


  final DataCount DataBigWidget = DataCount();

  BigWidget1({super.key});

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

        Expanded(child: ElevatedButton(
                        onPressed: () {

                          print(RLdataMeat.getdataLine());
                          print(RLdataRice.getdataLine());
                          print(RLdataVeget.getdataLine());

                          print("Confirm");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Confirm",
                            ),
                          ],
                        ),
                      ), ),

        SizedBox(height: 20,),
        // LinearPercentIndicator(
        //                   padding: const EdgeInsets.symmetric(horizontal: 20),
        //                   animation: true,
        //                   animationDuration: 1000,
        //                   lineHeight: 20.0,
        //                   percent: 0.5,//ใส่ค่าที่คำนวนออกมาได้ตรงนี้(เป็นทศนิยมนะ)
        //                   center: Text("50.0%"),//ค่าที่เขียนตรงหลอดpercent *อย่าลบบรรทัด ignore นะ ระวังติด error
        //                   // ignore: deprecated_member_use 
        //                   linearStrokeCap: LinearStrokeCap.round,
        //                   progressColor: Colors.green,
        //                 ),
      ]),
    );;
  }
  int getRLdataMeat(){
    return RLdataMeat.getdataLine();
  }
}