import 'package:flutter/material.dart';
import 'package:sikomti_app/fitur_sidebar/lihat_dan_pilih_kompen/lihat_kompen_page.dart';

class DetailTugasYangTersediaPage extends StatelessWidget {
  final ValueChanged<bool> onStatusChanged;
  final Map<String, dynamic> task;

  const DetailTugasYangTersediaPage({
    super.key,
    required this.onStatusChanged,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Tugas yang Tersedia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LihatKompenPage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDetailCard('Jenis Penugasan Kompen:',
                task['jenis_penugasan_kompen'], Icons.assignment),
            buildDetailCard('Deskripsi:', task['deskripsi'], Icons.description),
            buildDetailCard(
                'Pemberi Tugas:', task['pemberi_tugas'], Icons.person),
            buildDetailCard(
                'Bidang Keahlian:', task['bidang_keahlian'], Icons.school),
            buildDetailCard(
                'Jam Kompen:', task['jam_kompen'], Icons.access_time),
            buildDetailCard('Kuota:', task['kuota'], Icons.group),
            const SizedBox(height: 0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF28A745),
                  minimumSize: const Size(
                      100, 40), // Atur ukuran minimum (lebar, tinggi)
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Atur radius sudut
                  ),
                ),
                onPressed: () {
                  onStatusChanged(true);
                  Navigator.pop(
                      context, true); // Menutup halaman Detail setelah Apply
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const Column(
                          mainAxisSize: MainAxisSize
                              .min, // Menjaga ukuran dialog agar tidak terlalu besar
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 90,
                            ),
                            SizedBox(
                                height:
                                    10), // Memberi jarak antara ikon dan teks
                            Text(
                              'Permintaan berhasil dikirim',
                              style: TextStyle(
                                fontWeight: FontWeight
                                    .bold, // Membuat teks menjadi bold
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Menutup dialog
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Apply',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   width: double.infinity,
      //   padding: const EdgeInsets.all(16.0),
      //   decoration: const BoxDecoration(
      //     color: Color(0xFF0E1F43),
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20),
      //       topRight: Radius.circular(20),
      //     ),
      //   ),
      //   child: const Text(
      //     '2024© Sistem Kompensasi Jurusan',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 14,
      //     ),
      //   ),
      // ),
    );
  }

  // Menambahkan parameter icon pada buildDetailCard
  Widget buildDetailCard(String title, String? value, IconData icon) {
    return Card(
      elevation: 5, // Memberikan bayangan untuk efek depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Menambahkan sudut melengkung
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              icon, // Ikon disesuaikan dengan kategori
              color: Colors.blue,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2, 
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            Expanded(
              flex: 3, // Atur proporsi untuk detail
              child: Text(
                value ?? 'Data tidak tersedia',
                style: const TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.left, // Teks detail rata kiri
              ),
            ),
          ],
        ),
      ),
    );
  }
}
