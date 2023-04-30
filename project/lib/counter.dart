// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class counter extends StatefulWidget {
  const counter({super.key});

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  int number = 0;
  void reset(){
    number = 1;
  }
  void _decrementNumber(){
    setState(() {
      if(number<=0){
        setState(() {
          number = 1;
        });
      }
      number-=1;
    });
  }
  void _incrementNumber(){
    setState(() {
      number+=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _incrementNumber,
          child: Text('+'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(40, 30),
            primary: Color.fromARGB(255, 14, 89, 209)
          ),
        ),
        SizedBox(width: 16),
        Text(
          '$number',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: _decrementNumber,
          child: Text('-'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(40, 30)
          ),
        ),
      ],
    );
  }
}

class Reset extends StatefulWidget {
  final void Function() resetCounter;
  const Reset({super.key,required this.resetCounter});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  late int num;
  @override
  Widget build(BuildContext context) {
    counter cn = counter();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: (){
            widget.resetCounter();
          },
          child: Text('reset'),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 14, 89, 209)
          ),
        ),
    ]);
  }
}
