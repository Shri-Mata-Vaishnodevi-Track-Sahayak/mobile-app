import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ToiletWidget extends StatefulWidget {
  @override
  _ToiletWidgetState createState() => _ToiletWidgetState();
}

class _ToiletWidgetState extends State<ToiletWidget> {
  int toiletCounts = 0;

  @override
  void initState() {
    super.initState();
    _countToilets();
  }

  Future<List<dynamic>> loadJsonAsset() async {
    print("1st");
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = jsonDecode(jsonString);
    return jsonData;
  }

  Future<void> _countToilets() async {
    try {
      final data = await loadJsonAsset();
      setState(() {
        toiletCounts = 5;
      });
      print(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toilets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total toilets count: $toiletCounts'),
          ],
        ),
      ),
    );
  }
}
