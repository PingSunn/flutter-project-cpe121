import 'package:flutter/material.dart';

import 'countIcon.dart';

class RowLine extends StatelessWidget {
  final String type1,type2;
  const RowLine({Key? key,required this.type1,required this.type2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            //color: Colors.cyan,
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
                      height: 1.5,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                Expanded(child: CountIcon()),
                SizedBox(
                  width: 24,
                ),
                Expanded(child: CountIcon()),
                SizedBox(
                   width: 24,
                 ),
                Expanded(
                  child: Text(
                    type2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.fromLTRB(40, 114, 40, 0),
        //   child: Container(
        //     alignment: Alignment.center,
        //     height: 34,
        //     color: Colors.amber,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.fromLTRB(40, 168, 40, 0),
        //   child: Container(
        //     alignment: Alignment.center,
        //     height: 34,
        //     color: Colors.amber,
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //     ),
        //   ),
        // )
      ]),
    );
  }
}
