import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_project_1/dashboard/home_page.dart';

class UploadBerkasBeritaAcara extends StatefulWidget {
  @override
  _UploadBerkasBeritaAcaraState createState() =>
      _UploadBerkasBeritaAcaraState();
}

class _UploadBerkasBeritaAcaraState extends State<UploadBerkasBeritaAcara> {
  String? uploadedFileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Berkas Berita Acara',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(username: 'mahasiswa'),
              ),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Berkas Berita Acara:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return PopUpBeritaAcara(
                            onFileUploaded: (fileName) {
                              setState(() {
                                uploadedFileName = fileName;
                              });
                            },
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Unggah',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (uploadedFileName != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.insert_drive_file, // Ikon file
                        color: Colors.blue, // Warna ikon
                        size: 24.0, // Ukuran ikon
                      ),
                      const SizedBox(width: 8.0), // Jarak antara ikon dan teks
                      Expanded(
                        // Membuat teks fleksibel agar menyesuaikan ukuran layar
                        child: Text(
                          '$uploadedFileName', // Menampilkan nama file
                          maxLines: 5, // Membatasi hanya dua baris
                          overflow: TextOverflow
                              .ellipsis, // Menambahkan elipsis jika teks melebihi dua baris
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class PopUpBeritaAcara extends StatefulWidget {
  final Function(String) onFileUploaded;

  const PopUpBeritaAcara({super.key, required this.onFileUploaded});

  @override
  _PopUpBeritaAcaraState createState() => _PopUpBeritaAcaraState();
}

class _PopUpBeritaAcaraState extends State<PopUpBeritaAcara> {
  File? selectedFile;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.upload_file,
                  color: Colors.orange,
                  size: 30.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  'Unggah Surat Berita Acara Bebas Kompen',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _pickFile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Choose File',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (selectedFile != null) {
                      final fileName = path.basename(selectedFile!.path);
                      widget.onFileUploaded(fileName);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 70.0,
                            ),
                            content: const Text(
                              'Berhasil Unggah Berkas',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text(
                                'Silakan pilih file terlebih dahulu.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 248, 248),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
            if (selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          path.basename(selectedFile!.path),
                          maxLines: 2, // Membatasi hanya dua baris
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
