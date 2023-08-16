import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/driver.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ktpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadDriverData();
  }

  void loadDriverData() async {
    Driver? driver = await DatabaseHelper().getDriver(id: 1);
    if (driver != null) {
      _nameController.text = driver.name;
      _ktpController.text = driver.ktp;
      _passwordController.text = driver.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama Driver'),
            ),
            TextField(
              controller: _ktpController,
              decoration: InputDecoration(labelText: 'No.KTP'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Driver updatedDriver = Driver(
                  id: 1,
                  name: _nameController.text,
                  ktp: _ktpController.text,
                  password: _passwordController.text,
                );
                await DatabaseHelper().updateDriver(updatedDriver);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Profile Updated'),
                    content: Text('Profile has been updated.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
