import 'package:flutter/material.dart';
import 'StateWidget.dart';

class WeightControl extends StatelessWidget {
  const WeightControl({super.key});

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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Basic App")),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child:  Column(children: [
            //MyBox(),
            MyWidget(),
            SizedBox(height: 10,),
            //MyWidget(type1: 'data1',type2: 'data2',),
            SizedBox(height: 10,),
            //RowLine(type1: 'test',type2: 'asjdkasjld',),
            //MyBox(),
            Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Center(
                      child: ElevatedButton(onPressed: (){
                        print("Confirm");
                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Confirm"),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        textStyle: TextStyle(fontSize: 30,fontFamily: 'Twist')
                      ),
                      ),
                    ),
                  )
          ],)
        ),
      );
  }
}
