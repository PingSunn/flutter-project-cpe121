import 'package:project/model/Mbmi.dart';
import 'package:project/providers/bmi_provider.dart';
import 'package:project/screens/Diet.dart';
import 'package:project/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BmiProvider(),
      child: MaterialApp(
        title: 'BMI App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyDietapp(),
          '/history': (context) => HistoryScreen(),
        },
      ),
    );
  }
}
