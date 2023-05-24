import 'package:flutter/material.dart';
import 'HomeBox.dart';
import 'Bmi.dart';
import 'Diet.dart';
import 'Sodium.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          title: Text(
            "HypnoCare",
            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'Itim'),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                Color(0xffeeaeca),
                Color(0xff94bbe9)
              ]),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeightControl()),
                  );
                },
                child: HomeBox(
                  "Body Mass Index",
                  "{STATUS BMI}",
                  Color(0xffeeaeca),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Diet()),
                  );
                },
                child: HomeBox("Diet", "0", Color(0xff94bbe9)),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sodium()),
                  );
                },
                child: HomeBox(
                  "Sodium",
                  "0",
                  Color(0xffeeaeca),
                ),
              )
            ],
          ),
        ));
  }
}
