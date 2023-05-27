// ignore_for_file: file_names, unnecessary_import

import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SodiumTrackerApp(),
    ),
  );
}

class FoodItem {
  final String name;
  final double sodium;

  FoodItem({required this.name, required this.sodium});

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'],
      sodium: json['sodium'].toDouble(),
    );
  }
}

class NaaState extends State<Naa> {
  double sodium = 2000;
  double sumSodium = 0;
  double perSo = 0;

  @override
  void initState() {
    super.initState();
    calculateSumSodium();
  }

  void calculateSumSodium() {
    sumSodium = widget.selectedFoods
        .fold(0, (total, foodItem) => total + foodItem.sodium);
  }

  @override
  Widget build(BuildContext context) {
    Color progressColor;
    double percent = perSodium();

    if (percent >= 0.8) {
      progressColor = Colors.red;
    } else if (percent >= 0.5) {
      progressColor = Colors.yellow;
    } else {
      progressColor = Colors.green;
    }

    return SizedBox(
      height: 300,
      child: CircularPercentIndicator(
        radius: 120.0,
        lineWidth: 24.0,
        percent: percent,
        center: Text(
          '${(percent * 100).toStringAsFixed(0)}%',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        progressColor: progressColor,
      ),
    );
  }

  double perSodium() {
    perSo = (sumSodium / sodium);
    return perSo;
  }

  @override
  void didUpdateWidget(covariant Naa oldWidget) {
    super.didUpdateWidget(oldWidget);
    calculateSumSodium();
  }
}

class SodiumTrackerApp extends StatefulWidget {
  const SodiumTrackerApp({Key? key}) : super(key: key);

  @override
  SodiumTrackerAppState createState() => SodiumTrackerAppState();
}

class SodiumTrackerAppState extends State<SodiumTrackerApp> {
  String searchQuery = '';
  List<FoodItem> availableFoods = [];
  List<FoodItem> selectedFoods = [];
  int totalSodium = 0;
  List<String> history = [];

  @override
  void initState() {
    super.initState();
    loadFoodItems();
    loadSodiumHistory();
  }

  Future<void> loadFoodItems() async {
    String jsonData = await rootBundle.loadString('assets/food_data.json');
    List<dynamic> jsonList = json.decode(jsonData);

    setState(() {
      availableFoods = jsonList.map((item) => FoodItem.fromJson(item)).toList();
    });
  }

  Future<void> loadSodiumHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      history = prefs.getStringList('sodiumHistory') ?? [];
    });
  }

  void _onFoodItemSelected(FoodItem foodItem, bool selected) {
    setState(() {
      if (selected) {
        selectedFoods.add(foodItem);
        totalSodium += foodItem.sodium.toInt();
        saveSodiumHistory(foodItem);
      } else {
        selectedFoods.remove(foodItem);
        totalSodium -= foodItem.sodium.toInt();
        removeSodiumHistory(foodItem);
      }
    });
  }

  void saveSodiumHistory(FoodItem foodItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String entry =
        '${foodItem.name} - ${foodItem.sodium} mg - ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())}';
    history.add(entry);

    setState(() {});

    await prefs.setStringList('sodiumHistory', history);
  }

  void removeSodiumHistory(FoodItem foodItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String entry = '${foodItem.name} - ${foodItem.sodium} mg';
    history.remove(entry);
    await prefs.setStringList('sodiumHistory', history);
  }

  @override
  Widget build(BuildContext context) {
    List<FoodItem> filteredFoods = availableFoods.where((foodItem) {
      final nameLower = foodItem.name.toLowerCase();
      final queryLower = searchQuery.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    return MaterialApp(
      title: 'Sodium Tracker',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('ปริมาณโซเดียมที่ควรบริโภคใน 1 วัน'),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: navigateToHistoryPage,
            ),
          ],
        ),
        body: Column(
          children: [
            Naa(selectedFoods: selectedFoods),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredFoods.length,
                itemBuilder: (context, index) {
                  final foodItem = filteredFoods[index];
                  final isSelected = selectedFoods.contains(foodItem);
                  return ListTile(
                    title: Text(foodItem.name),
                    subtitle: Text('Sodium: ${foodItem.sodium} mg'),
                    trailing: Text(
                      isSelected ? 'Selected' : '',
                      style: const TextStyle(color: Colors.green),
                    ),
                    onTap: () {
                      if (isSelected) {
                        _onFoodItemSelected(foodItem, false);
                      } else {
                        if (totalSodium + foodItem.sodium <= 2000) {
                          _onFoodItemSelected(foodItem, true);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('คำเตือน!!!'),
                                content: const Text(
                                  'ปริมาณโซเดียมไม่ควรเกิน 2000 มิลลิกรัมต่อวัน',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Text(
                'Total Sodium: $totalSodium mg',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: confirmSelection,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToHistoryPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryPage(
          selectedFoods: selectedFoods,
          totalSodium: totalSodium,
          history: history,
        ),
      ),
    );
  }

  void confirmSelection() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Selection'),
          content: Text(
            'ต้องการยืนยันเมนูที่เลือกใช่ไหม\nTotal Sodium: $totalSodium mg',
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryPage(
                      selectedFoods: selectedFoods,
                      totalSodium: totalSodium,
                      history: history,
                    ),
                  ),
                ).then((_) {});
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class HistoryPage extends StatefulWidget {
  final List<FoodItem> selectedFoods;
  final int totalSodium;
  final List<String> history;

  const HistoryPage({
    Key? key,
    required this.selectedFoods,
    required this.totalSodium,
    required this.history,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> updatedHistory = [];

  @override
  void initState() {
    super.initState();
    updatedHistory = widget.history;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการบริโภคโซเดียม'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: updatedHistory.length,
              itemBuilder: (context, index) {
                final historyEntry = updatedHistory[index];
                final entryParts = historyEntry.split(' - ');
                final foodName = entryParts[0];
                final sodium = entryParts[1];
                final recordingTime = entryParts[2];

                return ListTile(
                  title: Text(foodName),
                  subtitle: Text('Sodium: $sodium'),
                  trailing: Text(recordingTime),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              clearSodiumHistory();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('History cleared')),
              );
            },
            child: const Text('Clear History'),
          ),
        ],
      ),
    );
  }

  void clearSodiumHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sodiumHistory');

    setState(() {
      updatedHistory = [];
    });

    widget.history.clear();
    await prefs.setStringList('sodiumHistory', widget.history);
  }
}

int calculateTotalSodium(List<String> history) {
  int totalSodium = 0;

  for (String entry in history) {
    int sodiumIndex = entry.lastIndexOf('-') + 1;
    int sodium =
        int.tryParse(entry.substring(sodiumIndex, entry.length - 3).trim()) ??
            0;
    totalSodium += sodium;
  }

  return totalSodium;
}

Future<List<String>> getSodiumHistory() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('sodiumHistory') ?? [];
}

class Naa extends StatefulWidget {
  final List<FoodItem> selectedFoods;

  const Naa({Key? key, required this.selectedFoods}) : super(key: key);

  @override
  NaaState createState() => NaaState();
}
