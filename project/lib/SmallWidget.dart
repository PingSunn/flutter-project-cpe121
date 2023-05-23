import 'package:flutter/material.dart';
import 'package:mybasicapp/provider/dataCountIcon.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'RowLine.dart';

class SmallWidget extends StatelessWidget {
  final String data,total,unit1,unit2;
  DataCount RLsmall = DataCount();
  RowLine RL = RowLine(type1: '');
  int result = 0;
  SmallWidget({Key? key,required this.data,required this.total,required this.unit1,required this.unit2}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
  RowLine RL = RowLine(type1: data);

  

    return Container(
      height: 250,
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
        RL,
        SizedBox(height: 30,),
        Row(
          children: [
            SizedBox(width: 120,),
            Text(unit1,style: 
            TextStyle(
              fontFamily: 'Twist'
            ),),
            SizedBox(width: 60,),
            Text(unit2,style: 
            TextStyle(
              fontFamily: 'Twist'
            ),),
            SizedBox(width: 50,),
            Text(total,style: 
            TextStyle(
              fontFamily: 'Twist'
            ),)
          ],
        ),
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
      // Expanded(child: ElevatedButton(
      //                  onPressed: () {
      //                     RLsmall.SetData(RL.getdataLine());
      //                   print(RLsmall.data);
      //                   print("Confirm");
      //                  },
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                    children: [
      //                     Text(
      //                       "Confirm",
      //                     ),
      //                   ],
      //                  ),
      //                ), ),
      ]),
    );
  }
  int getRLSmallWidget(){
    RLsmall.SetData(RL.getdataLine());
    return RLsmall.data??=0;
  }
}