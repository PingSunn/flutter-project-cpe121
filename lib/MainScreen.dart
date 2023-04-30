import 'package:flutter/material.dart';
import 'HomeBox.dart';
import 'WeightControl.dart';
import 'Diet.dart';
import 'Sodium.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          title: Text(
            "รักคนที่เขารักเรามันยากตรงไหนวะ",
            style: TextStyle(color: Colors.white),
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
                  "Weight control",
                  "{STATUS BMI}",
                  Color(0xFF39D2C0),
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
                child: HomeBox("Diet", "0", Color(0xFF4B39EF)),
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
                  Color(0xFFEE8B60),
                ),
              )
            ],
          ),
        ));
  }
}
