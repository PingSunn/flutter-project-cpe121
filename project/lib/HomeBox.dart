// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeBox extends StatelessWidget {
  String title = "";
  String text = "";
  Color color = Colors.black;

  HomeBox(this.title, this.text, this.color, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: color, border: Border.all(width: 2), borderRadius: BorderRadius.circular(10)),
      height: 150,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ))
        ],
      ),
    );
  }
}
