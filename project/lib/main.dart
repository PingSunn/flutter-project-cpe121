// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:project/Foodmenu.dart';
import 'HomeBox.dart';

void main() {
  runApp(myApp());
}

//Create Widget StatelessWidget
class myApp extends StatelessWidget {
  // const myApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Title",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<FoodMenu> menu = [
  //   FoodMenu("Fried Rice", "100"),
  //   FoodMenu("Pork fried", "100")
  // ];
  @override
  void initState() {
    super.initState();
    print("Call initState......");
  }

  @override
  Widget build(BuildContext context) {
    //กลุ่มข้อมูล Text Widget

    return Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              HomeBox("Test", 100, Colors.black, 120),
              SizedBox(
                height: 10,
              ),
              HomeBox("Test", 100, Colors.black, 120),
              SizedBox(
                height: 10,
              ),
              HomeBox("Test", 100, Colors.black, 120)
            ],
          ),
        ));
  }
}
