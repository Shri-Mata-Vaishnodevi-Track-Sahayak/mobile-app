import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyGeolocationWidget extends StatefulWidget {
  @override
  _MyGeolocationWidgetState createState() => _MyGeolocationWidgetState();
}


class _MyGeolocationWidgetState extends State<MyGeolocationWidget> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check for permissions
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Handle the case where location services are disabled
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case where permission is denied
        return;
      }
    }

    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {});
    } catch (e) {
      // Handle any errors that occur
      print(e);
    }
  }

  // Future<void> _getLocation() async {
  //   var _locationMessage; 
  //   Position position;
  //   try {
  //     position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);
  //   } catch (e) {
  //     position = null
  //   }
  //   if (position) {
  //     setState(() {
  //       _locationMessage =
  //           'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
  //     });
  //   } else {
  //     setState(() {
  //       _locationMessage = 'Unable to retrieve location';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geolocation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPosition != null)
              Text('Latitude: ${_currentPosition?.latitude}'),
            if (_currentPosition != null)
              Text('Longitude: ${_currentPosition?.longitude}'),
            ElevatedButton(
              onPressed: _determinePosition,
              child: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}