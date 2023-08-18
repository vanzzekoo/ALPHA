import 'package:flutter/material.dart';
import '../models/driver.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  final Driver driver;

  ProfileScreen(this.driver);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ktpController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.driver.name);
    _ktpController = TextEditingController(text: widget.driver.ktp);
    _passwordController = TextEditingController(text: widget.driver.password);
  }

  void _saveChanges() {
    // Tidak perlu mengubah nilai controller
    setState(() {
      widget.driver.name = _nameController.text;
      widget.driver.ktp = _ktpController.text;
      widget.driver.password = _passwordController.text;
    });

    // Simpan perubahan ke database lokal (bisa menggunakan shared preferences, SQLite, atau solusi penyimpanan lokal lainnya)

    // Tampilkan pesan berhasil kepada pengguna
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Perubahan profil telah disimpan.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama Driver'),
            ),
            TextField(
              controller: _ktpController,
              decoration: InputDecoration(labelText: 'KTP'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
