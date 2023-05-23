import 'package:flutter/material.dart';
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
        home: const MyHomePage(title: "ประวัติ"),
      ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransectionProvider>(context,listen: false).initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer(
          builder: (context, TransectionProvider provider, Widget? child) {
            var count = provider.transection.length;//นับจำนวนข้อมูล
            if (count<=0) {
              return Center(child: Text("ไม่พบข้อมูล",style: TextStyle(fontSize: 35),),);
            }
            else{
              return ListView.builder(
                itemCount: count,
                itemBuilder: (context,int index){
                transections data = provider.transection[index];
                  return Card(
                    child: ListTile(title: Row(
                      children: [
                        Text("เนื้อ = ${data.dataMeat.toString()}"),
                      ],
                    )),
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