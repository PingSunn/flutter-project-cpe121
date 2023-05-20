import 'package:flutter/material.dart';
import 'package:mybasicapp/provider/dataCountIcon.dart';

import 'RowLineText.dart';
import 'countIcon.dart';

class RowLine extends StatelessWidget {
  final DataCount datacount1 = DataCount();
  final DataCount datacount2 = DataCount();
  int result = 0;
  final String type1;

  RowLine({Key? key,required this.type1,}) : super(key: key);

  Stream<int> TextData() async*{
    int data = 0;
    while(data <= 0){
      await Future.delayed(Duration(seconds: 0));
      getdataLine();
      //print("going to push stream");
      //data = newdata;
      yield getdataLine();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Container(
            alignment: Alignment.center,
            height: 34,
            //color: Colors.amber,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Container(
            alignment: Alignment.center,
            height: 34,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    type1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Twist',
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(child: CountIcon(datacount: datacount1,)),
                SizedBox(
                  width: 24,
                ),
                Expanded(child: CountIcon(datacount: datacount2,)),
                SizedBox(
                   width: 24,
                 ),
                Expanded(
                  child: StreamBuilder(
                    stream: TextData(),
                    builder: (context, snapshot) {
                      return RowLineText(externalData: snapshot.data.toString(),);
                    }
                  )
                ),
                // Expanded(child: ElevatedButton(
                //         onPressed: () {
                //           getdataLine();
                //           print(getdataLine());
                //           print("Confirm");
                //         },
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               "Confirm",
                //             ),
                //           ],
                //         ),
                //       ), )
              ],
            ),
          ),
        ),
      ]),
    );
  }
  

  int getdataLine(){
    //print("getdataline");
    int d1 = datacount1.data??=0;
    int d2 = datacount2.data??=0;
    result = d1+d2;
    return result;
  }
}
