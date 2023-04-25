import 'package:flutter/material.dart';

class MoneyBox extends StatelessWidget {
  String title = "";
  double amount = 0.0;
  Color color = Colors.black;
  double size = 0.0;

  MoneyBox(this.title, this.amount, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      height: size,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: Text(
            amount.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ))
        ],
      ),
    );
  }
}
