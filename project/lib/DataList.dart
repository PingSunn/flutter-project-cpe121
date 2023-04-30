import 'package:flutter/material.dart';
import 'counter.dart';

class TestScreen extends StatefulWidget {
  final String text;
  const TestScreen({Key? key, required this.text}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Table(children: [
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Center(
                        child: Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Twist',
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Center(child: counter()),
                  ),
                ),
                TableCell(
                  child: Center(child: counter()),
                ),
              ],
            ),
          ]),
        ),
      ],
    ));
  }
}
