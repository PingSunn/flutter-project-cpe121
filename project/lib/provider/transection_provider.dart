import 'package:flutter/foundation.dart';
import 'package:mybasicapp/database/transection_db.dart';
import 'package:mybasicapp/models/transections.dart';


class TransectionProvider with ChangeNotifier{
  List<transections> transection = [];


  List<transections> getTransection(){
    return transection;
  }

  void addTransection(transections statement) async{
    var db = TransectionDB(dbName: "transections.db");
    //บันทึกข้อมูล
    await db.InsertData(statement);
    
    //ดึงข้อมูลมาแสดงผล
    transection = await db.loadAllData();
    //transection.insert(0,statement);

    //แจ้งเตือน consumer
    notifyListeners();
  }
}