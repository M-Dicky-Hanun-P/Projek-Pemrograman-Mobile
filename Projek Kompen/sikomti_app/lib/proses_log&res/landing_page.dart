import 'dart:async'; // Dibutuhkan untuk Timer
import 'package:flutter/material.dart';
import 'package:sikomti_app/proses_log&res/login_as.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginAs()),
        );
      },
    );
  }

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
          const Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tambahkan animasi loading
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF0E1F43)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Loading to open app...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0E1F43),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer di bagian bawah layar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 14, 31, 67),
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
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
