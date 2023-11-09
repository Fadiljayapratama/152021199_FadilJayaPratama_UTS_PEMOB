import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
// Import package url_launcher untuk membuka tautan

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi Multifungsi'),
        backgroundColor:
            Colors.orange[300], // Ganti warna latar belakang AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              radius: 200,
              backgroundImage: AssetImage(
                  'assets/images/fadil.jpeg'), // Ganti dengan path gambar profil Anda
            ),
            SizedBox(height: 20.0),
            Text(
              'Nama Author: Fadil Jaya Pratama',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Email: fadil.jaya@mhs.itenas.ac.id'),
            Text('Mahasiswa: Informatika ITENAS'),
            SizedBox(height: 20.0),
            Text(
              'Deskripsi Aplikasi Multifungsi:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Aplikasi Multifungsi ini dirancang untuk membantu Anda dalam berbagai tugas sehari-hari. '
              'Dengan berbagai fitur yang disediakan, aplikasi ini dapat digunakan untuk kalkulator, konversi suhu, konversi mata uang, hitung bmi.',
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.github,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.facebook,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.linkedin,
                    ),
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.twitter,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
