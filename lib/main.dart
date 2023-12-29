import 'package:flutter/material.dart';
import 'geolocater_demo.dart';
import 'toilets.dart';

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
                _navigateToPage(1, context);
              },
            ),
            ListTile(
              title: const Text('Geolocater Demo'),
              onTap: () {
                _navigateToPage(2, context);
              },
            ),
            ListTile(
              title: const Text('Toilets'),
              onTap: () {
                _navigateToPage(3, context);
              },
            ),
          ],
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '18.2 km to bhawan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  void _navigateToPage(int pageIndex, BuildContext context) {
    if (pageIndex == 1) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              MyHomePage())); // Close the drawer after navigation
    } else if (pageIndex == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyGeolocationWidget()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ToiletWidget()));
    }
  }
}
