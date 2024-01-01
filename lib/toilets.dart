import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ToiletWidget extends StatefulWidget {
  @override
  _ToiletWidgetState createState() => _ToiletWidgetState();
}

class _ToiletWidgetState extends State<ToiletWidget> {
  int toiletCounts = 0;
  List<dynamic> toiletList = [];

  @override
  void initState() {
    super.initState();
    _countToilets();
  }

  Future<List<dynamic>> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/data.json');
    final jsonData = jsonDecode(jsonString);
    return jsonData;
  }

  Future<void> _countToilets() async {
    try {
      final data = await loadJsonAsset();
      List filtered = data.where((item) => item['type'].contains('T')).toList();
      setState(() {
        toiletCounts = filtered.length;
        toiletList = filtered;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return toiletList == []
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: const Text('Toilets'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total toilets count: $toiletCounts'),
                  Expanded(
                      child: ListView.builder(
                          itemCount: toiletList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(
                                  "Latitude: ${toiletList[index]["latitude"]}"),
                              subtitle: Text(
                                  "Longitude: ${toiletList[index]["longitude"]}"),
                            );
                          })),
                ],
              ),
            ),
          );
  }
}
