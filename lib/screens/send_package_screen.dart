import 'package:flutter/material.dart';

class SendPackageScreen extends StatefulWidget {
  @override
  _SendPackageScreenState createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  final TextEditingController _locationAController = TextEditingController();
  final TextEditingController _locationBController = TextEditingController();

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
            // Add logic to calculate distance between locations
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Calculate distance and show result
              },
              child: Text('Hitung Jarak'),
            ),
            // Display calculated distance here
          ],
        ),
      ),
    );
  }
}
