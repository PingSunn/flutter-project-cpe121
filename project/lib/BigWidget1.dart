import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mybasicapp/RowLine.dart';
import 'package:mybasicapp/models/dataBigWidget.dart';

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

  Stream<String> TextOut() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      String textOut;
      int Total = getRLdataMeat() + getRLdataRice() + getRLdataVeget();
      if ((0.20 < getRLdataMeat() / Total && getRLdataMeat() / Total < 0.30) ||
          (0.20 < getRLdataRice() / Total && getRLdataRice() / Total < 0.30) ||
          (0.45 < getRLdataVeget() / Total && getRLdataVeget() / Total < 0.55)) {
        textOut = "GOOD";
      } else {
        textOut = "BAD";
      }
      //print("going to push stream");
      yield textOut;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 20)]),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'asset/image/Spoon.png',
                height: 80,
                width: 140,
              ),
              Image.asset(
                'asset/image/WoodLadel.png',
                height: 100,
                width: 80,
              ),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 120,
            ),
            Text(
              'ช้อน',
              style: TextStyle(fontFamily: 'Twist'),
            ),
            SizedBox(
              width: 70,
            ),
            Text(
              'ทัพพี',
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
        SizedBox(
          height: 30,
        ),
        RLdataMeat,
        SizedBox(
          height: 30,
        ),
        RLdataRice,
        SizedBox(
          height: 30,
        ),
        RLdataVeget,
        SizedBox(
          height: 30,
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

        //ProgressbarState(result: getAllWidgetData(),),
        StreamBuilder<String>(
          stream: TextOut(),
          builder: (context, snapshot) {
            return Text(snapshot.data as String);
          }
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

}

