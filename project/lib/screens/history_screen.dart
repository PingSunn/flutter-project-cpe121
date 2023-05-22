import 'dart:io';

import 'package:project/model/Mbmi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/bmi_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

//import 'main.dart';

class HistoryScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        body: Consumer(
          builder: (context, BmiProvider provider, child) {
            var count = provider.mobmi.length;
            if (count <= 0) {
              return Center(
                child: Text(
                  "ไม่พบข้อมูล",
                  style: const TextStyle(fontSize: 20),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Mbmi data = provider.mobmi[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Text(data.nbmi.toString()),
                        ),
                        title: Text(data.mess),
                        subtitle: Text(DateFormat("dd/mm/yyyy").format(data.date)),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
