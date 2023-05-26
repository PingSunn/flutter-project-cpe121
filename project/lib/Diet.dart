import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/BigWidget1.dart';
import 'package:project/MainScreen.dart';
import 'package:project/SmallWidget.dart';
import 'package:project/models/transections.dart';
import 'package:project/provider/transection_provider.dart';
import 'package:project/screen/history.dart';
import 'package:provider/provider.dart';

class Diet extends StatelessWidget {
  
  Diet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransectionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Weight(
          title: 'Flutter Demo Home Page',
          navigateBack: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class Weight extends StatelessWidget {
  final VoidCallback navigateBack;
  BigWidget1 Bwg = BigWidget1();
  SmallWidget Swg1 = SmallWidget(
    total: 'รวม(กรัม)',
    data: 'ผลไม้',
    unit1: '   ชิ้น', //ขอลักไก่หน่อยละกัน ไม่รู้จะแก้ยังไงให้ตรงละ
    unit2: '   ผล',
    asset1: Image.asset(
      'assets/images/OnePieceOfApple.jpg',
      height: 100,
      width: 100,
    ),
    asset2: Image.asset(
      'assets/images/Apple.png',
      height: 100,
      width: 100,
    ),
    format1: 90,
    format2: 300,
    limit: 350, //อย่าลบนะ
  );
  SmallWidget Swg2 = SmallWidget(
    total: 'รวม(มล.)',
    data: 'นม',
    unit1: 'แก้ว',
    unit2: 'กล่อง',
    asset1: Image.asset(
      'assets/images/glass_of_milk.png',
      height: 100,
      width: 100,
    ),
    asset2: Image.asset(
      'assets/images/Milk.png',
      height: 100,
      width: 100,
    ),
    format1: 200,
    format2: 250,
    limit: 1000,
  );
  String statusDiet = '';
  Weight({Key? key,required String title,required this.navigateBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     print(Bwg.getRLdataMeat());
      //     print(Bwg.getRLdataRice());
      //     print(Bwg.getRLdataVeget());
      //     print(Swg1.getRLSmallWidget());
      //     print("All = " + Bwg.getAllWidgetData().toString());
      //   },
      //   label: Text(
      //     'Confirm',
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontFamily: 'Twist',
      //       shadows: [
      //         BoxShadow(
      //           color: Colors.black,
      //           offset: Offset(2, 2),
      //           spreadRadius: 10,
      //         )
      //       ],
      //     ),
      //   ),
      //   backgroundColor: Color(0xffeeaeca),
      // ),
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: false,
          floating: false,
          expandedHeight: 200,
          shadowColor: Colors.black,
          backgroundColor: Color(0xffeeaeca),
          leading: IconButton(
            onPressed: navigateBack,
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              shadows: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(5, 5),
                    spreadRadius: 10,
                    blurRadius: 10)
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => History()));
                },
                icon: Icon(
                  Icons.history,
                  size: 30,
                  shadows: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 5),
                        spreadRadius: 10,
                        blurRadius: 10)
                  ],
                ))
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'อาหารจานสุขภาพ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Twist',
                    shadows: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(5, 5),
                          spreadRadius: 10,
                          blurRadius: 10)
                    ],
                  ),
                ),
                Text(
                  "Healthy Food",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Twist',
                      shadows: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(5, 5),
                            spreadRadius: 10,
                            blurRadius: 10)
                      ],
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            background: Container(
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Image.asset(
                    'assets/images/healthy_food.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
            padding: EdgeInsets.all(10.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                Bwg,
                SizedBox(
                  height: 20,
                ),
                Swg1,
                SizedBox(
                  height: 20,
                ),
                Swg2,
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.green, Colors.blue],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if(Bwg.getStatusBigWidget() == 'GOOD' && Swg1.percentOut == 1 && Swg2.percentOut == 1){
                          statusDiet = "คุณกินได้ดีเยี่ยม";
                        }
                        else{
                          statusDiet = "การกินยังไม่เหมาะสม";
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('บันทึกข้อมูลเรียบร้อย'),
                          action: SnackBarAction(
                            label: 'history',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => History()));
                            },
                          ),
                        ));
                        //เตรียมข้อมูล
                        transections statement = transections(
                            dataMeat: Bwg.getRLdataMeat(),
                            dataRice: Bwg.getRLdataRice(),
                            dataVeget: Bwg.getRLdataVeget(),
                            dataFruit: Swg1.getRLSmallWidget(),
                            dataMilk: Swg2.getRLSmallWidget(),
                            date: DateTime.now(),
                            status: statusDiet);

                        //เรียก Provider
                        var provider = Provider.of<TransectionProvider>(context,
                            listen: false);
                        provider.addTransection(statement);

                        print(Bwg.getRLdataMeat());
                        print(Bwg.getRLdataRice());
                        print(Bwg.getRLdataVeget());
                        print(Swg1.getRLSmallWidget());
                        print(Swg2.getRLSmallWidget());
                        print(statusDiet);
                        print("Confirm");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontFamily: 'Twist',
                          fontSize: 32,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(5, 5),
                                spreadRadius: 10,
                                blurRadius: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )))
      ]),
    );
  }
}
