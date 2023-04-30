import 'package:animated_background/animated_background.dart';
import 'package:database/DataList.dart';
import 'package:database/PictureList.dart';
import 'package:flutter/material.dart';
import 'counter.dart';
import 'package:percent_indicator/percent_indicator.dart';
//ไปดูบรรทัดที่ 88 แล้วฝากดูให้หน่อยว่ามันerrorอะไร(มันติดException overflow)
//จริงๆไฟล์นี้มันรันได้แล้วแหละ แต่ถ้ามันรันWidgetอันนั้นได้ โค้ดจะสั้นลงเยอะมาก กราบขออภัยที่มีความสามารถแค่นี้;-;
class testing extends StatefulWidget {
  const testing({Key? key});

  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 8, 225),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.blue, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
                options: ParticleOptions(
              spawnMaxRadius: 50,
              spawnMinSpeed: 10.00,
              particleCount: 68,
              spawnMaxSpeed: 50,
              minOpacity: 0.3,
              spawnOpacity: 0.1,
              baseColor: Colors.blue,
              //image: Image(image: AssetImage('asset/Screenshot_20210915-211141_Instagram copy.jpg')),
            )),
            vsync: this,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "อาหารจานสุขภาพ",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Twist',
                          color: Colors.white),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Healthy Food",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          /*gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topLeft,
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 146, 250, 255)
                              ]),*/
                          boxShadow: [BoxShadow(blurRadius: 20)]),
                      height: 550,
                      /*child: Column(//ถ้าทำได้ก็ฝากแก้ด้วยนะเพื่อนๆ เราทำละ Exception overflow infinity pixel
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                TestScreen(text: "text"),
                                //PictureList(image: Image.asset('asset/Screenshot_20210915-211141_Instagram copy.jpg'))
                              ],
                            ),
                          ),
                        ],
                      ), 
                    
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}*/
                      child: Expanded(
                        child: Table(
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Center(child: Text("")),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Image.asset(
                                            'asset/Screenshot_20210915-211141_Instagram.jpg')),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Image.asset(
                                            'asset/Screenshot_20210915-211141_Instagram.jpg')),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Center(
                                        child: Text(
                                      "ผัก",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Twist',
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Center(
                                        child: Text(
                                      "ข้าว",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Twist',
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                                TableCell(
                                  child: Center(child: counter()),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 40.0),
                                    child: Center(
                                        child: Text(
                                      'เนื้อสัตว์',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Twist',
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Center(
                                        child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(
                                        child: Text(
                                      "data",
                                      style: TextStyle(fontFamily: 'Twist'),
                                    )), //ฝากคนทำแก้ให้ที
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(
                                        child: Text("data",
                                            style: TextStyle(
                                                fontFamily: 'Twist'))), //ฝากแก้
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [BoxShadow(blurRadius: 20)]),
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Table(children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Center(child: Text("")),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Image.asset(
                                            'asset/Screenshot_20210915-211141_Instagram.jpg')),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Image.asset(
                                            'asset/Screenshot_20210915-211141_Instagram.jpg')),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Center(
                                        child: Text(
                                      "ผัก",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Twist',
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Center(
                                        child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0,bottom: 1),
                                    child: Center(
                                        child: Text(
                                      "data",
                                      style: TextStyle(fontFamily: 'Twist'),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0,bottom: 1),
                                    child: Center(
                                        child: Text(
                                      "data",
                                      style: TextStyle(fontFamily: 'Twist'),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                          LinearPercentIndicator(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 20.0,
                            percent: 0.5,
                            center: Text("50.0%"),
                            linearStrokeCap: LinearStrokeCap.round,
                            progressColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [BoxShadow(blurRadius: 20)]),
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Table(children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Center(child: Text("")),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Image.asset(
                                            'asset/Screenshot_20210915-211141_Instagram.jpg')),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                        child: Image.asset(
                                            'asset/Screenshot_20210915-211141_Instagram.jpg')),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Center(
                                        child: Text(
                                      "นม",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Twist',
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Center(child: counter()),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 45.0),
                                    child: Center(
                                        child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0,bottom: 1),
                                    child: Center(
                                        child: Text(
                                      "กล่อง",
                                      style: TextStyle(fontFamily: 'Twist'),
                                    )),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5.0,bottom: 1),
                                    child: Center(
                                        child: Text(
                                      "แก้ว",
                                      style: TextStyle(fontFamily: 'Twist'),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                          LinearPercentIndicator(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            animation: true,
                            animationDuration: 1000,
                            lineHeight: 20.0,
                            percent: 0.5,
                            center: Text("50.0%"),
                            linearStrokeCap: LinearStrokeCap.round,
                            progressColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            print(counter.value);
                          },
                          child: Text("dataaaaaaaaaaaaaaaaaaa"),
                        )
                      ],
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ));
  }
}
