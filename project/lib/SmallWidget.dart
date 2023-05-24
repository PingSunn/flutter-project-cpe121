import 'package:flutter/material.dart';
import 'package:mybasicapp/provider/dataCountIcon.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'RowLine.dart';

class SmallWidget extends StatelessWidget {
  final String data, total, unit1, unit2;
  final Image asset1, asset2;
  DataCount RLsmall = DataCount();
  RowLine RL = RowLine(type1: '');
  int result = 0;
  SmallWidget(
      {Key? key,
      required this.data,
      required this.total,
      required this.unit1,
      required this.unit2,
      required this.asset1,
      required this.asset2})
      : super(key: key);

  Stream<double> percent() async* {
    double percent = 0.00;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      percent = RL.getdataLine() / 1000;
      //print("going to push stream");
      yield percent;
    }
  }

  @override
  Widget build(BuildContext context) {
    RL = RowLine(type1: data);

    return Container(
      height: 270,
      decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //       colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 236, 255, 174)],
          //       begin: Alignment.topLeft,
          //       end: Alignment.bottomRight,
          //     ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 20)]),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              asset1,
              asset2
              // Image.asset(asset1,height: 100,width: 100,),
              // Image.asset(asset1,height: 100,width: 100,),
              // Image.asset('asset/image/OnePieceOfApple.jpg',height: 100,width: 100,),
              // Image.asset('asset/image/Red_Apple.jpg',height: 100,width: 100,),
              //Image.asset('assets/image/chevron-left.png'),
            ],
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 120,
            ),
            Text(
              unit1,
              style: TextStyle(fontFamily: 'Twist'),
            ),
            SizedBox(
              width: 60,
            ),
            Text(
              unit2,
              style: TextStyle(fontFamily: 'Twist'),
            ),
            SizedBox(
              width: 50,
            ),
            Text(
              total,
              style: TextStyle(fontFamily: 'Twist'),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        RL,
        SizedBox(
          height: 30,
        ),
        StreamBuilder(
          stream: percent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              double percent = snapshot.data as double;
              return LinearPercentIndicator(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                animation: true,
                animationDuration: 1000,
                lineHeight: 20.0,
                percent: percent, // Use snapshot.data here
                center: Text(percent.toString()),
                // ignore: deprecated_member_use
                linearStrokeCap: LinearStrokeCap.round,
                progressColor: Colors.green,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),

        // Expanded(child: ElevatedButton(
        //                  onPressed: () {
        //                   print(getRLSmallWidget());
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

  int getRLSmallWidget() {
    //print("RLsmall");
    //print(RL.getdataLine());
    RLsmall.SetData(RL.getdataLine());
    return RLsmall.data ??= 0;
  }
}
