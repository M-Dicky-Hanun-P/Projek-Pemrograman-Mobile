import 'package:flutter/material.dart';
import 'package:flutter_project_1/login_page.dart';

class LoginAs extends StatelessWidget {
  const LoginAs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 31, 67),
        iconTheme: const IconThemeData(
            color: Colors.white),
        title: const Text(
          'Kembali',
          style: TextStyle(
              color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Login Sebagai',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Fungsi ketika tombol ditekan
                      //     Navigator.push(
                      //       // Navigasi ke halaman LoginPage.
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               const LoginPage()), // Membuat rute baru ke LoginPage.
                      //     );
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.orange,
                      //     padding: const EdgeInsets.symmetric(vertical: 12),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     'Admin',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 17,
                      //     ),
                      //   ),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Fungsi ketika tombol ditekan
                      //     Navigator.push(
                      //       // Navigasi ke halaman LoginPage.
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               const LoginPage()), // Membuat rute baru ke LoginPage.
                      //     );
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.orange,
                      //     padding: const EdgeInsets.symmetric(vertical: 12),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     'Dosen/Karyawan',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 17,
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () {
                          // Fungsi ketika tombol ditekan
                          Navigator.push(
                            // Navigasi ke halaman LoginPage.
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoginPage()), // Membuat rute baru ke LoginPage.
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Mahasiswa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
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
              width: double.infinity,
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
}
