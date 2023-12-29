import 'package:flutter/material.dart';
import 'geolocater_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMVD Track sahayak'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                _navigateToPage(0);
              },
            ),
            ListTile(
              title: const Text('Geolocater Demo'),
              onTap: () {
                _navigateToPage(1);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '18.2 km to bhawan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            '18.2 km to bhawan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _navigateToGeolocatorPage(context);
            },
            child: const Text('Go to geo locater'),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int pageIndex) {
    Navigator.pop(context); // Close the drawer after navigation
  }

  void _navigateToGeolocatorPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            MyGeolocationWidget())); // Close the drawer after navigation
  }
}
