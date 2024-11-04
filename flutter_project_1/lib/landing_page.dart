import 'package:flutter/material.dart';
import 'package:flutter_project_1/login_as.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                width: double.infinity,
                color: const Color(0xFF0E1F43),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/logo_jti_polinema.png',
                          height: 70,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/SIKOMTI.png',
                          height: 60,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'POLITEKNIK NEGERI MALANG',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Fungsi ketika tombol ditekan
                          Navigator.push(
                            // Navigasi ke halaman LoginAs.
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoginAs()), // Membuat rute baru ke LoginAs.
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Go to Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Footer di bagian bawah layar
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.all(15), // Memberi ruang di dalam footer
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 14, 31, 67), // Warna biru gelap yang sama
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

// CustomClipper untuk membuat bentuk lengkung presisi di bawah
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); // Mulai dari titik kiri bawah
    path.quadraticBezierTo(
      size.width / 2, // Titik tengah di bagian bawah
      size.height + 50, // Tinggi lengkungan
      size.width, // Titik kanan bawah
      size.height - 50, // Akhir lengkungan
    );
    path.lineTo(size.width, 0); // Garis ke kanan atas
    path.close(); // Menutup jalur
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
