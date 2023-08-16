import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/driver.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gojek App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama Driver'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  Driver? driver = await DatabaseHelper().getDriver(
                      id: 1); // Gunakan tipe Driver? untuk variabel driver
                  if (driver == null) {
                    Driver defaultDriver = Driver(
                      id: 1,
                      name: 'DRIVER 1',
                      ktp: '',
                      password: '1234',
                    );
                    await DatabaseHelper().insertDriver(defaultDriver);
                    driver = defaultDriver;
                  }

                  if (_nameController.text == driver.name &&
                      _passwordController.text == driver.password) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(), // Gunakan kelas yang benar
                      ),
                    );
                  } else {
                    // Show error message
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Login Failed'),
                        content: Text('Invalid name or password.'),
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
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
