import 'package:flutter/material.dart';
import 'package:flutter_project_1/proses_log&res/landing_page.dart';
import 'package:flutter_project_1/proses_log&res/login_page.dart';

class LoginAs extends StatelessWidget {
  const LoginAs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 31, 67),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Kembali',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Login Sebagai',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 14, 31, 67),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLoginButton(
                        context,
                        label: 'Admin',
                        icon: Icons.admin_panel_settings,
                        onPressed: () {
                          // Menampilkan Dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30), // Membuat sudut lebih bulat
                                ),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.warning_amber_outlined,
                                        color: Colors.orange,
                                        size: 60,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Notifikasi',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        "Aplikasi ini hanya digunakan untuk mahasiswa",
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.orange, // Warna tombol
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: const Text(
                                          'Tutup',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 245, 245, 245),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      _buildLoginButton(
                        context,
                        label: 'Mahasiswa',
                        icon: Icons.person,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                      ),
                      _buildLoginButton(
                        context,
                        label: 'Dosen/Karyawan',
                        icon: Icons.school,
                        onPressed: () {
                          // Menampilkan Dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30), // Membuat sudut lebih bulat
                                ),
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.warning_amber_outlined,
                                        color: Colors.orange,
                                        size: 60,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Notifikasi',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      const Text(
                                        "Aplikasi ini hanya digunakan untuk mahasiswa",
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.orange, // Warna tombol
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: const Text(
                                          'Tutup',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 245, 245, 245),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Footer di bagian bawah
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color(0xFF0E1F43),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Center(
                child: Text(
                  '2024© Sistem Kompensasi Jurusan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        shadowColor: Colors.orangeAccent,
      ),
    );
  }
}
