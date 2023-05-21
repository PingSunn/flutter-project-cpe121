import 'package:flutter/material.dart';
import 'package:mybasicapp/BigWidget1.dart';
import 'package:mybasicapp/SmallWidget.dart';


class WeightControl extends StatelessWidget {

  WeightControl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: MyHomePage(title: 'Flutter Demo Home Page',),
    );
  }
}

class MyHomePage extends StatelessWidget {

  BigWidget1 Bwg = BigWidget1();
  SmallWidget Swg1 = SmallWidget(total: 'รวม(กรัม)',data: 'ผลไม้',unit1: 'ผล',unit2: 'ชิ้น',);
  SmallWidget Swg2 = SmallWidget(total: 'รวม(มล.)',data: 'นม',unit1: 'กล่อง',unit2: 'แก้ว',);
  //final DataCount Bwgdata = DataCount();
  MyHomePage({Key? key,required String title,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                        print(Swg2.getRLSmallWidget());

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
        ));
  }
}
