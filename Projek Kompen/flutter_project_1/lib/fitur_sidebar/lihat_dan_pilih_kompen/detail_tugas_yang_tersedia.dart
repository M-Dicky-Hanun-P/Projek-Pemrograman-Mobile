import 'package:flutter/material.dart';

class DetailTugasYangTersediaPage extends StatefulWidget {
  final ValueChanged<bool>? onStatusChanged;

  const DetailTugasYangTersediaPage({
    Key? key,
    this.onStatusChanged,
    required Map<String, dynamic> task,
  }) : super(key: key);

  @override
  _DetailTugasYangTersediaPageState createState() =>
      _DetailTugasYangTersediaPageState();
}

class _DetailTugasYangTersediaPageState
    extends State<DetailTugasYangTersediaPage> {
  bool isRequested = false;

  // Data dalam format JSON
  final Map<String, dynamic> taskDetails = {
    "nama_penugasan": "Bongkar pasang CPU",
    "jenis_penugasan_kompen": "Pembelian",
    "deskripsi":
        "Melakukan instalasi harddisk yang barusan saya beli ke dalam CPU saya, sekaligus membersihkan CPUnya. Lakukan cek pada tiap komponen apakah ada yang perlu diganti juga atau tidak.",
    "pemberi_tugas": "Kadek Suarjuna",
    "bidang_keahlian": "-",
    "jam_kompen": "4 jam",
    "kuota": "5 orang",
  };

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              SizedBox(height: 10),
              Text(
                'Berhasil',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text('Permintaan berhasil terkirim'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isRequested = true;
                });
                widget.onStatusChanged
                    ?.call(true); // Panggil hanya jika tidak null
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Hero dengan latar belakang dekoratif
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Colors.blue.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.assignment, color: Colors.white, size: 40),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        taskDetails['nama_penugasan'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Task Details Section inside a box with a decorative border
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailItem("Jenis Penugasan Kompen:",
                        taskDetails["jenis_penugasan_kompen"]),
                    buildDetailItem("Deskripsi:", taskDetails["deskripsi"]),
                    buildDetailItem(
                        "Pemberi Tugas:", taskDetails["pemberi_tugas"]),
                    buildDetailItem(
                        "Bidang Keahlian:", taskDetails["bidang_keahlian"]),
                    buildDetailItem("Jam Kompen:", taskDetails["jam_kompen"]),
                    buildDetailItem("Kuota:", taskDetails["kuota"]),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Apply Button with dynamic styling
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isRequested
                        ? Colors.grey
                        : const Color(0xFF28A745), // Hijau untuk tombol Apply
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 12.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    shadowColor:
                        isRequested ? Colors.transparent : Colors.green,
                  ),
                  onPressed: isRequested
                      ? null
                      : () {
                          showSuccessDialog();
                        },
                  child: Text(
                    isRequested ? 'Requested' : 'Apply',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Color(0xFF0E1F43),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: const Text(
          '2024© Sistem Kompensasi Jurusan',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  // Fungsi pembantu untuk membuat item detail
  Widget buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
