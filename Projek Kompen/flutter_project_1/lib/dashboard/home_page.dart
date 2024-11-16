import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project_1/fitur_sidebar/lihat_dan_pilih_kompen/lihat_kompen_page.dart';
import 'package:flutter_project_1/fitur_sidebar/update_progres_tugas_kompen/update_progres_tugas_kompen.dart';
import 'package:flutter_project_1/proses_log&res/login_page.dart';
import 'package:flutter_project_1/fitur_sidebar/upload_berita_acara/upload_berkas_berita_acara.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/logo_jti_polinema.png',
                    height: 50,
                  ),
                ],
              ),
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
              // const SizedBox(height: 5),
              // const Text(
              //   'POLITEKNIK NEGERI MALANG',
              //   style: TextStyle(
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
              const Divider(color: Color.fromARGB(212, 255, 255, 255)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(207, 255, 255, 255),
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
                              borderRadius: BorderRadius.circular(10),
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
                    MaterialPageRoute(builder: (context) => const LihatKompenPage()),
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
                    MaterialPageRoute(builder: (context) => const UpdateTugasPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_document, color: Colors.white),
                title: const Text(
                  'Update Kompen Selesai',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => UploadBerkasBeritaAcara()),
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
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            color: Colors.green,
            child: Text(
              'Selamat datang ${widget.username}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue[50],
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
                        borderRadius:
                            BorderRadius.circular(10),
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
        email: 'user@gmail.com',
        phone: '08123456789',
        password: 'Contoh',
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

class ProfilePageDialog extends StatefulWidget {
  final String username;
  final String email;
  final String phone;
  final String password;

  const ProfilePageDialog({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  @override
  State<ProfilePageDialog> createState() => _ProfilePageDialogState();
}

class _ProfilePageDialogState extends State<ProfilePageDialog> {
  XFile? _profileImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
      });
    }
  }

  final List<String> kompenTags = [
    'Tidak ada',
    'Programmer Mobile Flutter',
    'Programmer Web Laravel',
    'Data Visualization Power BI'
  ];
  String? selectedTag;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(color: Color.fromARGB(211, 0, 0, 0)),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: _profileImage != null
                    ? FileImage(File(_profileImage!.path))
                    : null,
                backgroundColor: Colors.grey[300],
                child: _profileImage == null
                    ? const Icon(Icons.camera_alt, size: 40)
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email *',
                counterText: 'contoh: email@google.com',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username *',
                counterText: 'contoh: 2241760000',
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'No Telepon *',
                counterText: 'contoh: 08123456789',
              ),
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                helperText: '* tidak wajib di isi',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Pilih Kompetensi',
                  style: TextStyle(fontSize: 13, color: Colors.black54)),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              items: kompenTags
                  .map((tag) => DropdownMenuItem(
                        value: tag,
                        child: Text(tag),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedTag = value;
                });
              },
              value: selectedTag,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _profileImage);
          },
          child: const Row(
            mainAxisSize:
                MainAxisSize.min, // Agar ukuran tombol sesuai dengan kontennya
            children: [
              Icon(Icons.save,
                  color: Color.fromARGB(255, 55, 153, 246)), // Ikon simpan
              SizedBox(width: 5), // Jarak antara ikon dan teks
              Text('Simpan'), // Teks tombol
            ],
          ),
        ),
      ],
    );
  }
}
