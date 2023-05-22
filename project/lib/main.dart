import 'package:bmiaja/model/Mbmi.dart';
import 'package:bmiaja/providers/bmi_provider.dart';
import 'package:bmiaja/screens/Diet.dart';
import 'package:bmiaja/screens/history_screen.dart';
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
