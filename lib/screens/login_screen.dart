import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'send_package_screen.dart';
import 'history_screen.dart';
import '../models/driver.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Driver loggedInDriver = Driver(
    id: 1,
    name: 'DRIVER 1',
    ktp: 'KTP DRIVER 1',
    password: '1234',
  );

  bool isLoggedIn = false;

  void _performLogin() {
    if (_nameController.text == loggedInDriver.name &&
        _passwordController.text == loggedInDriver.password) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      // Tampilkan pesan kesalahan
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Nama atau password salah.'),
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
  }

  void _performLogout() {
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return Scaffold(
        appBar: AppBar(title: Text('Aplikasi Gojek')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(loggedInDriver),
                    ),
                  );
                },
                child: Text('Profil'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendPackageScreen(),
                    ),
                  );
                },
                child: Text('Kirim Paket'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryScreen(),
                    ),
                  );
                },
                child: Text('History'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _performLogout,
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Aplikasi Gojek')),
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
                  onPressed: _performLogin,
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}
