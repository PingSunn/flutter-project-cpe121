// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

class CountIcon extends StatefulWidget {
  const CountIcon({super.key});

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
                num-=1;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              child: Image.asset(
                'asset/image/chevron-left.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          SizedBox(
            width: 1,
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
            width: 1,
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                num+=1;
              });
              
            },
            child: Container(
              width: 20,
              height: 20,
              child: Image.asset(
                'asset/image/chevron-right.png',
                width: 20,
                height: 20,
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
