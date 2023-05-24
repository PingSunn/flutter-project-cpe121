import 'package:project/model/Mbmi.dart';
import 'package:project/providers/bmi_provider.dart';
import 'package:project/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget picturex() {
  return Container(
    width: 120.0,
    height: 120.0,
    child: Image.asset('assets/images/x.jpg'),
  );
}

Widget picturet() {
  return Container(
    width: 120.0,
    height: 120.0,
    child: Image.asset('assets/images/t.jpg'),
  );
}

Widget picturep() {
  return Container(
    width: 120.0,
    height: 120.0,
    child: Image.asset('assets/images/p.jpg'),
  );
}

Widget pictureh() {
  return Container(
    width: 120.0,
    height: 120.0,
    child: Image.asset('assets/images/h.png'),
  );
}

Widget picturef() {
  return Container(
    width: 120.0,
    height: 120.0,
    child: Image.asset('assets/images/f.jpg'),
  );
}

class WeightControl extends StatefulWidget {
  const WeightControl({super.key});

  @override
  State<WeightControl> createState() => _WeightControlState();
}

class _WeightControlState extends State<WeightControl> {
  @override
  void initState() {
    super.initState();
    Provider.of<BmiProvider>(context, listen: false).initData();
  }

  final _heightControl = TextEditingController();
  final _weightControl = TextEditingController();

  final nnbimControl = TextEditingController();
  final mmessControl = TextEditingController();

  double? _bmi;
  String _message = " ";
  Widget? pho;
  String __ = " ";
  void _calculate() {
    final double? height = double.tryParse(_heightControl.value.text);
    final double? weight = double.tryParse(_weightControl.value.text);
    if (height == null || height <= 0 || weight == null || weight <= 0 || height >= 10) {
      setState(() {
        _bmi = null;
        _message = "ต้องมีอะไรผิดพลาดตรงไหน\nป้อนข้อมูลใหม่^^";
        pho = picturex();
      });
    } else {
      setState(() {
        _bmi = weight / (height * height);

        if (_bmi! < 18.5) {
          _message = "คุณผอมเกินไป \nควรเพิ่มน้ำหนักสักหน่อย";
          pho = picturep();
        } else if (_bmi! < 25) {
          _message = "คุณมีร่างกายที่สมดุลแล้ว \nสุดยอดไปเลย";
          pho = pictureh();
        } else if (_bmi! < 30) {
          _message = "คุณเริ่มท้วมไปแล้วนะ \nควรลดน้ำหนักสักหน่อย";
          pho = picturet();
        } else {
          _message = "คุณอ้วนแล้วนะ \nควรลดน้ำหนัก";
          pho = picturef();
        }
      });
      final nnbimControl = _bmi!.toStringAsFixed(2);
      final mmessControl = _message;

      var nnbmi = nnbimControl;
      var mmess = mmessControl;

      Mbmi statement = Mbmi(mess: mmess, nbmi: double.parse(nnbmi), date: DateTime.now());

      var provider = Provider.of<BmiProvider>(context, listen: false);
      provider.addMbmi(statement);
    }
  }

  void _history() {
    setState(() {
      _bmi = null;
      _message = " ";
      pho = null;

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HistoryScreen();
      }));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 320,
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "BMI",
                    textAlign: TextAlign.center,
                  ),
                  TextField(
                    decoration: new InputDecoration(labelText: "น้ำหนัก(กิโลกรัม)"),
                    keyboardType: TextInputType.number,
                    controller: _weightControl,
                  ),
                  TextField(
                    decoration: new InputDecoration(labelText: "ส่วนสูง(เมตร)"),
                    keyboardType: TextInputType.number,
                    controller: _heightControl,
                  ),
                  Text(
                    __,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: _calculate,
                    child: const Text('คำนวณ'),
                  ),
                  Text(
                    _bmi == null ? '' : _bmi!.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 50),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    child: pho,
                  ),
                  Text(
                    _message,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _history,
                    child: const Text('ประวัติ'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
