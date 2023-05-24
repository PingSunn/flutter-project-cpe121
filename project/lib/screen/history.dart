import 'package:flutter/material.dart';
import 'package:mybasicapp/MainScreen.dart';
import 'package:mybasicapp/WeightControl.dart';
import 'package:mybasicapp/models/transections.dart';
import 'package:mybasicapp/provider/transection_provider.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

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
        home: const Profile(title: "ประวัติ"),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key, required this.title});

  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransectionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    bool order = false;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 30,
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
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffeeaeca), Color(0xff94bbe9)]),
            ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Weight(
                              title: '',
                            )));
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    order = !order;
                  });
                },
                icon: Icon(Icons.restore))
          ],
        ),
        body: Consumer(
          builder: (context, TransectionProvider provider, Widget? child) {
            var count = provider.transection.length; //นับจำนวนข้อมูล
            if (count <= 0) {
              return Center(
                child: Text(
                  "ไม่พบข้อมูล",
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              return ListView.builder(
                reverse: order,
                itemCount: count,
                itemBuilder: (context, int index) {
                  transections data = provider.transection[index];
                  return Card(
                    elevation: 8,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('asset/image/clock.png'),
                        radius: 30,
                      ),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'วันที่ ${time.day}/${time.month}/${(time.year) + 543} \nเวลา : ${time.hour}:${time.minute}:${time.second} น.',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text("เนื้อ = ${data.dataMeat.toString()} กรัม"),
                          Text("ข้าว = ${data.dataRice.toString()} กรัม"),
                          Text("ผัก = ${data.dataVeget.toString()} กรัม"),
                          Text("ผลไม้ = ${data.dataFruit.toString()} กรัม"),
                          Text("นม = ${data.dataMilk.toString()} มิลลิลิตร"),
                        ],
                      ),
                      dense: true,
                    ),
                  );
                },
                // itemBuilder: (context, int index) {
                //   transections data = provider.transection[index];
                //   return Card(
                //     margin: EdgeInsets.all(5),//ระยะห่าง card
                //     elevation: 5,//เงา
                //     child: ListTile(
                //       leading: CircleAvatar(
                //           radius: 30,
                //           child: FittedBox(
                //             child: Text(""),
                //           )),
                //       title: Text(index.toString()),
                //       subtitle: Text(""),
                //     ),
                //   );
                // }
              );
            }
          },
        ));
  }
}
