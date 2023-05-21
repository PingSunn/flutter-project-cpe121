import 'package:flutter/material.dart';
import 'package:mybasicapp/BigWidget1.dart';
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
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  BigWidget1 Bwg = BigWidget1();
  SmallWidget Swg1 = SmallWidget(
    total: 'รวม(กรัม)',
    data: 'ผลไม้',
    unit1: '  ผล',
    unit2: '   ชิ้น',
  );
  SmallWidget Swg2 = SmallWidget(
    total: 'รวม(มล.)',
    data: 'นม',
    unit1: 'กล่อง',
    unit2: 'แก้ว',
  );
  //final DataCount Bwgdata = DataCount();
  MyHomePage({
    Key? key,
    required String title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('asset/image/yellow box background.jpg'),
          fit: BoxFit.fitHeight
          )
        ),
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
                Bwg,
                SizedBox(
                  height: 10,
                ),
                Swg1,
                SizedBox(
                  height: 10,
                ),
                Swg2,
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {

                        print(Bwg.getRLdataMeat());
                        print(Bwg.getRLdataRice());
                        print(Bwg.getRLdataVeget());
                        print(Swg1.getRLSmallWidget());

                        print("Confirm");
                      },
                      child: Text("Confirm"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.black,
                            shadowColor: Colors.black,
                            // shadow radius
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            textStyle:
                                TextStyle(fontSize: 30, fontFamily: 'Twist')
                                ),  
                      ),
                      //   style: ButtonStyle(
                      //     backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      //     foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      //     shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                      //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //       EdgeInsets.symmetric(horizontal: 100),
                      //     ),
                      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //     ),
                      //     textStyle: MaterialStateProperty.all<TextStyle>(
                      //       TextStyle(fontSize: 30, fontFamily: 'Twist'),
                      //     ),
                      //     elevation: MaterialStateProperty.all<double>(100), // Set the shadow elevation
                      //   ),
                      // )
                  ),
                )
            ])
            ),
          ),
        ),
      );
  }
}
