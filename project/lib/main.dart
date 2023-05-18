import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:mybasicapp/BigWidget.dart';
import 'package:mybasicapp/SmallWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
            spawnMaxRadius: 200,
            spawnMinSpeed: 1.00,
            particleCount: 68,
            spawnMaxSpeed: 50,
            minOpacity: 0.3,
            spawnOpacity: 0.1,
            baseColor: Color.fromARGB(255, 255, 255, 166),
            //image: Image(image: AssetImage('asset/Screenshot_20210915-211141_Instagram copy.jpg')),
          )),
          vsync: this,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "อาหารจานสุขภาพ",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Twist',
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Healthy Food",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 20,),
                  BigWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  SmallWidget(total: 'รวม(กรัม)',data: 'ผลไม้',result: '0',unit1: 'ผล',unit2: 'ชิ้น',),
                  SizedBox(
                    height: 10,
                  ),
                  SmallWidget(total: 'รวม(มล.)',data: 'นม',result: '0',unit1: 'กล่อง',unit2: 'แก้ว',),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print("Confirm");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Confirm",
                              style:
                                  TextStyle(fontFamily: 'Twist', fontSize: 32),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            textStyle:
                                TextStyle(fontSize: 30, fontFamily: 'Twist')),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
