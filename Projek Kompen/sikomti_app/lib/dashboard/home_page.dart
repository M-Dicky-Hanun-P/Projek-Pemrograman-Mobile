import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sikomti_app/fitur_sidebar/lihat_dan_pilih_kompen/lihat_kompen_page.dart';
import 'package:sikomti_app/fitur_sidebar/update_progres_tugas_kompen/tugas_on_the_go.dart';
import 'package:sikomti_app/proses_log&res/login_page.dart';
import 'package:sikomti_app/fitur_sidebar/upload_berita_acara/upload_berkas_berita_acara.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profileImagePath');
    if (imagePath != null) {
      setState(() {
        _profileImage = XFile(imagePath);
      });
    }
  }

  Future<void> _saveProfileImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImagePath', path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFF0E1F43),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
      ),
      drawer: Drawer(
        child: Container(
          color: const Color(0xFF0E1F43),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/SIKOMTI.png',
                    height: 40,
                  ),
                ],
              ),
              const Divider(color: Color.fromARGB(255, 255, 255, 255)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      backgroundImage: _profileImage != null
                          ? FileImage(File(_profileImage!.path))
                          : null,
                      child: _profileImage == null
                          ? const Icon(Icons.person, color: Colors.white)
                          : null,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _showEditProfileDialog(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Color.fromARGB(212, 255, 255, 255)),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.white),
                title: const Text(
                  'Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.assignment, color: Colors.white),
                title: const Text(
                  'Lihat dan Pilih Kompen',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LihatKompenPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.update, color: Colors.white),
                title: const Text(
                  'Update Progres Tugas Kompen',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TugasOnTheGo()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_document, color: Colors.white),
                title: const Text(
                  'Upload Berita Acara',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UploadBerkasBeritaAcara()),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(100, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('LOGOUT'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/logo_jti_polinema.png',
                      height: 150,
                      width: 250,
                    ),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xFF0E1F43),
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/img/SIKOMTI.png',
                          height: 70,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // const SizedBox(height: 1),
                    // const Text(
                    //   'Sistem Kompensasi Jurusan Teknologi Informasi',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    // const SizedBox(height: 2),
                    // const Text(
                    //   'Politeknik Negeri Malang',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Container(
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
        ],
      ),
    );
  }

  Future<void> _showEditProfileDialog(BuildContext context) async {
    final updatedProfileImage = await showDialog<XFile?>(
      context: context,
      builder: (context) => ProfilePageDialog(
        username: widget.username,
        email: 'mahasiswa@gmail.com',
        phone: '08123456789',
        password: 'mahasiswa123',
        bidangKompetensi: 'Coding Mobile Flutter',
      ),
    );
    if (updatedProfileImage != null) {
      setState(() {
        _profileImage = updatedProfileImage;
      });
      _saveProfileImage(updatedProfileImage.path);
    }
  }
}

class ProfilePageDialog extends StatelessWidget {
  final String username;
  final String email;
  final String phone;
  final String password;
  final String bidangKompetensi;

  const ProfilePageDialog({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.bidangKompetensi,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Profil Pengguna'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),
          Text(
            'Detail Informasi: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),

          // Email
          Row(
            children: [
              const Icon(Icons.alternate_email,
                  size: 20, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Email: $email',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),

          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),

          // Nomor Telepon
          Row(
            children: [
              const Icon(Icons.phone_iphone, size: 20, color: Colors.green),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'No Telepon: $phone',
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),

          Row(
            children: [
              const Icon(Icons.lock, size: 20, color: Colors.orange),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Password: ${'*' * password.length}', // Menampilkan password tersembunyi
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Menampilkan pesan menggunakan dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Informasi Password',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        content: const Text(
                          'Password hanya bisa dilihat di aplikasi website.',
                          style: TextStyle(fontSize: 14),
                        ),
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800], // Warna tombol
                              foregroundColor:
                                  Colors.white, // Warna teks tombol
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); // Menutup dialog
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Text(
                    'Lihat Password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 1),
          const Divider(color: Colors.black54, height: 20),

          // Bidang Kompetensi
          Row(
            children: [
              const Icon(Icons.school, size: 20, color: Colors.purple),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Bidang Kompetensi: $bidangKompetensi',
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800], // Warna latar tombol
              foregroundColor: Colors.white, // Warna teks tombol
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10), // Padding dalam tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Sudut melingkar
              ),
              elevation: 5, // Efek bayangan tombol
            ),
            onPressed: () => Navigator.of(context).pop(), // Menutup dialog
            child: const Text(
              'Tutup',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
