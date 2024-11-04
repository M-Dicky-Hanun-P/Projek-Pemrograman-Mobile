import 'package:flutter/material.dart'; // Mengimpor paket material dari Flutter, yang menyediakan banyak widget dan tema untuk aplikasi.
import 'landing_page.dart';

void main() {
  runApp(
      const MyApp()); // Fungsi main() adalah titik masuk aplikasi. Fungsi runApp() menjalankan widget MyApp sebagai root widget aplikasi.
}

class MyApp extends StatelessWidget {
  // Mendefinisikan kelas MyApp yang merupakan StatelessWidget, artinya tidak memiliki keadaan yang bisa berubah.
  const MyApp(
      {super.key}); // Konstruktor kelas MyApp, menggunakan 'super.key' untuk memungkinkan penggunaan kunci.

  @override
  Widget build(BuildContext context) {
    // Override metode build() untuk mendeskripsikan tampilan widget.
    return MaterialApp(
      // Mengembalikan widget MaterialApp, yang merupakan widget dasar untuk aplikasi Material.
      debugShowCheckedModeBanner:
          false, // Menonaktifkan banner debug di pojok kanan atas aplikasi.
      title:
          'SIKOMTI', // Menetapkan judul aplikasi yang ditampilkan di taskbar.
      theme: ThemeData(
          primarySwatch: Colors
              .blue), // Menetapkan tema aplikasi dengan palet warna biru sebagai warna utama.
      home:
          LandingPage(), // Menetapkan halaman awal aplikasi yang akan ditampilkan, yaitu LandingPage.
    );
  }
}
