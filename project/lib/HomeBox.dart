import 'package:flutter/material.dart';

class HomeBox extends StatelessWidget {
  final String title;
  final String text;
  final Color color;

  HomeBox(this.title, this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
