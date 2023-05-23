import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mybasicapp/RowLine.dart';
import 'package:mybasicapp/models/dataBigWidget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BigWidget1 extends StatelessWidget {
  final RowLine RLdataMeat = RowLine(
    type1: 'เนื้อสัตว์',
  );
  final RowLine RLdataRice = RowLine(
    type1: 'ข้าว',
  );
  final RowLine RLdataVeget = RowLine(
    type1: 'ผัก',
  );

  BigWidget1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      decoration: BoxDecoration(
        color: Colors.white,
          // gradient: LinearGradient(
          //   colors: [
          //     Color.fromARGB(255, 255, 255, 255),
          //     Color.fromARGB(255, 236, 255, 174)
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(29),
          boxShadow: [BoxShadow(blurRadius: 20)]),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'asset/image/1631549281278.png',
                height: 100,
                width: 100,
              ),
              Image.asset(
                'asset/image/1631549281278.png',
                height: 100,
                width: 100,
              ),
            ],
          ),
        ),
        //SizedBox(height: 50,),
        RLdataMeat,
        SizedBox(
          height: 50,
        ),
        RLdataRice,
        SizedBox(
          height: 50,
        ),
        RLdataVeget,
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            SizedBox(
              width: 120,
            ),
            Text(
              'ทัพพี',
              style: TextStyle(fontFamily: 'Twist'),
            ),
            SizedBox(
              width: 70,
            ),
            Text(
              'ช้อน',
              style: TextStyle(fontFamily: 'Twist'),
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              'รวม(กรัม)',
              style: TextStyle(fontFamily: 'Twist'),
            )
          ],
        ),

        // Expanded(child: ElevatedButton(
        //                 onPressed: () {
        //                   print(getRLdataMeat());
        //                   print(getRLdataRice());
        //                   print(getRLdataVeget());
        //                   print('All = '+getAllWidgetData().toString());
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

        SizedBox(
          height: 20,
        ),
        //ProgressbarState(result: getAllWidgetData(),),
        LinearPercentIndicator(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          animation: true,
                          animationDuration: 1000,
                          lineHeight: 20.0,
                          percent: getAllWidgetData(),//ใส่ค่าที่คำนวนออกมาได้ตรงนี้(เป็นทศนิยมนะ)
                          center: Text(getAllWidgetData().toStringAsFixed(0)+"%"),//ค่าที่เขียนตรงหลอดpercent *อย่าลบบรรทัด ignore นะ ระวังติด error
                          // ignore: deprecated_member_use
                          linearStrokeCap: LinearStrokeCap.round,
                          progressColor: Colors.green,
                        ),
      ]),
    );
  }

  int getRLdataMeat() {
    return getBigWidgetdata().data1;
  }

  int getRLdataRice() {
    return getBigWidgetdata().data2;
  }

  int getRLdataVeget() {
    return getBigWidgetdata().data3;
  }

  dataBigWidget getBigWidgetdata() {
    dataBigWidget dataBwg = dataBigWidget(
        data1: RLdataMeat.getdataLine(),
        data2: RLdataRice.getdataLine(),
        data3: RLdataVeget.getdataLine());
    return dataBwg;
  }

  double getAllWidgetData() {
    double result = (RLdataMeat.getdataLine() + RLdataRice.getdataLine() + RLdataVeget.getdataLine()) /1000;
    return result;
  }
}

class ProgressbarState extends StatefulWidget {
  const ProgressbarState({super.key, required this.result});
  final result;

  @override
  State<ProgressbarState> createState() => _ProgressbarStateState();
}

class _ProgressbarStateState extends State<ProgressbarState> {
  double percentage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
    percentage = widget.result;
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (percentage > 0.4) {
          timer.cancel();
        } else {
          percentage += 0.1;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearPercentIndicator(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          animation: false,
          animationDuration: 1000,
          lineHeight: 20.0,
          percent: percentage, //ใส่ค่าที่คำนวนออกมาได้ตรงนี้(เป็นทศนิยมนะ)
          center: Text(
              (percentage*100).toStringAsFixed(0)+"%"), //ค่าที่เขียนตรงหลอดpercent *อย่าลบบรรทัด ignore นะ ระวังติด error
          // ignore: deprecated_member_use
          linearStrokeCap: LinearStrokeCap.round,
          progressColor: Colors.green,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(percentage <0.9){
                      percentage += 0.1;
                    }else{
                      percentage == 1;
                    }
                  });
                },
                child: Text('Increase')),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    if(percentage > 0.1){
                      percentage -= 0.1;
                    }else{
                      percentage == 0;
                    }
                  });
                }, child: Text('Decrease'))
          ],
        )
      ],
    );
  }
}
