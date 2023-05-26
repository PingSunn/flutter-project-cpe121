// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'HomeBox.dart';
import 'WeightControl.dart';
import 'Diet.dart';
import 'Sodium.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint("Call initState......");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "รักคนที่เขารักเรามันยากตรงไหนวะ",
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffeeaeca), Color(0xff94bbe9)],
            ),
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
                  MaterialPageRoute(builder: (context) => const WeightControl()),
                );
              },
              child: HomeBox(
                "Weight control",
                "{STATUS BMI}",
                const Color(0xffeeaeca),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Diet()),
                );
              },
              child: HomeBox("Diet", "0", const Color(0xff94bbe9)),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SodiumTrackerApp()),
                );
              },
              child: HomeBox(
                "Sodium",
                "0",
                const Color(0xffeeaeca),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
