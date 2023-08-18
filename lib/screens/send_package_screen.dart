import 'package:flutter/material.dart';
import 'dart:math';

class SendPackageScreen extends StatefulWidget {
  @override
  _SendPackageScreenState createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  final TextEditingController _locationAController = TextEditingController();
  final TextEditingController _locationBController = TextEditingController();
  double distanceBetweenLocations = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kirim Barang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _locationAController,
              decoration: InputDecoration(labelText: 'Lokasi A'),
            ),
            TextField(
              controller: _locationBController,
              decoration: InputDecoration(labelText: 'Lokasi B'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double latA = double.tryParse(_locationAController.text) ?? 0.0;
                double longA =
                    double.tryParse(_locationAController.text) ?? 0.0;
                double latB = double.tryParse(_locationBController.text) ?? 0.0;
                double longB =
                    double.tryParse(_locationBController.text) ?? 0.0;

                double distance = calculateDistance(latA, longA, latB, longB);
                setState(() {
                  distanceBetweenLocations = distance;
                });
              },
              child: Text('Hitung Jarak'),
            ),
            SizedBox(height: 10),
            Text(
                'Jarak Antara Lokasi A dan B adalah: ${distanceBetweenLocations.toStringAsFixed(2)} Km'),
          ],
        ),
      ),
    );
  }

  double calculateDistance(
      double latA, double longA, double latB, double longB) {
    const int radiusOfEarth = 6371; // Earth's radius in kilometers
    double latAInRadians = degToRad(latA);
    double longAInRadians = degToRad(longA);
    double latBInRadians = degToRad(latB);
    double longBInRadians = degToRad(longB);

    double dLat = latBInRadians - latAInRadians;
    double dLong = longBInRadians - longAInRadians;

    double a = pow(sin(dLat / 2), 2) +
        cos(latAInRadians) * cos(latBInRadians) * pow(sin(dLong / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return radiusOfEarth * c;
  }

  double degToRad(double degree) {
    return degree * (pi / 180);
  }
}
