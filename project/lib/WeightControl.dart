import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mybasicapp/BigWidget1.dart';
import 'package:mybasicapp/SmallWidget.dart';
import 'package:mybasicapp/models/transections.dart';
import 'package:mybasicapp/provider/transection_provider.dart';
import 'package:provider/provider.dart';

class WeightControl extends StatelessWidget {
  WeightControl({super.key});

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
        home: MyHomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  BigWidget1 Bwg = BigWidget1();
  SmallWidget Swg1 = SmallWidget(
    total: 'รวม(กรัม)',
    data: 'ผลไม้',
    unit1: 'ผล',
    unit2: 'ชิ้น',
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
            onPressed: () {
              Navigator.pop(context);
            },
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
                  'healthy Food',
                  style: TextStyle(
                    fontSize: 16,
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
                    'asset/image/healthy food.jpg',
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
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        //เตรียมข้อมูล
                        transections statement = transections(
                            dataMeat: Bwg.getRLdataMeat(),
                            dataRice: Bwg.getRLdataRice(),
                            dataVeget: Bwg.getRLdataVeget(),
                            dataFruit: Swg1.getRLSmallWidget(),
                            dataMilk: Swg2.getRLSmallWidget());

                        //เรียก Porvider
                        var provider = Provider.of<TransectionProvider>(context,
                            listen: false);
                        provider.addTransection(statement);

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
                            style: TextStyle(fontFamily: 'Twist', fontSize: 32),
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
            )))
      ]),
    );
  }
}
