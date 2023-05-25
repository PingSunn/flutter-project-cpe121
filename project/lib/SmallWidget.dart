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
      await Future.delayed(Duration(seconds: 0));
      percent = RL.getdataLine() / 1000;
      //print("going to push stream");
      yield percent;
    }
  }

  double _getProgressValue(int progress) {
    return progress / 100; // Convert progress to a value between 0.0 and 1.0
  }

  Color _getProgressColor(int progress) {
    if (progress <= 50) {
      return Colors.green;
    } else if (progress <= 100) {
      return Colors.yellow;
    } else {
      return Colors.red;
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
            children: [asset1, asset2],
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
              return LinearProgressIndicator(
                minHeight: 20.0,
                value: percent, // Use snapshot.data here
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
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
