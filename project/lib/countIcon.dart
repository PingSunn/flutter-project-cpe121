// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:mybasicapp/provider/dataCountIcon.dart';

class CountIcon extends StatefulWidget {
  final DataCount datacount;
  
  const CountIcon({super.key, required this.datacount});

  @override
  State<CountIcon> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CountIcon> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: 80,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                if(num>0){
                  num-=1;
                  widget.datacount.SetData(num);                  
                }
              });
            },
            child: Container(
              width: 25,
              height: 25,
              child: Image.asset(
                'asset/image/chevron-left.png',
              ),
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            num.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.5,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                num+=1;
                widget.datacount.SetData(num);
                print(widget.datacount.data);
              });
              
            },
            child: Container(
              width: 25,
              height: 25,
              child: Image.asset(
                'asset/image/chevron-right.png',
              ),
              
            ),
          ),
        ],
      ),
    );
  }
  int getDataIcon(){
    return widget.datacount.data??=0;
  }
}
