import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class UploadProgress extends StatefulWidget {
  const UploadProgress({super.key});

  @override
  State<UploadProgress> createState() => _UploadProgressState();
}

class _UploadProgressState extends State<UploadProgress> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    // Load JSON data
    const jsonData = '''
    {
      "assignment": {
        "name": "Bongkar pasang CPU",
        "type": "Pembelian",
        "description": "Melakukan instalasi harddisk yang barusan saya beli ke dalam cpu saya, sekaligus membersihkan cpunya. Lakukan cek pada tiap komponen apakah ada yang perlu diganti juga atau tidak.",
        "assigner": "Kadek Suarjuna",
        "expertise": "-",
        "compensationHours": "4 jam",
        "quota": "5 orang",
        "progress": 30
      }
    }
    ''';
    data = json.decode(jsonData)['assignment'];
  }

  // Fungsi untuk memperbarui progress
  void _updateProgress(int value) {
    setState(() {
      data['progress'] = value.clamp(0.0, 100.0); // Membatasi nilai dari 0-100
    });
  }

  // Menampilkan popup ketika tombol Update ditekan
  void _showSuccessPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 80,
          ),
          content: const Text(
            'Berhasil update progres',
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
                child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0074D9),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white), // warna teks tombol
              ),
            )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Upload Progress',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
      ),
      backgroundColor:
          const Color(0xFFF6F8FB), // Warna latar belakang abu-abu terang
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama penugasan:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(data['name'], style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 16),
                      const Text(
                        'Jenis Penugasan Kompen:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(data['type'], style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 17.0,
                      percent: data['progress'] / 100,
                      center: Text(
                        '${data['progress'].toInt()}%',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: Colors.blue,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data['progress'] >= 100 ? 'Finished' : 'On Progress',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 1,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(data['description'],
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Pemberi Tugas:',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(data['assigner'],
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Bidang Keahlian:',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(data['expertise'],
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Jam Kompen:',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(data['compensationHours'],
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text(
                          'Kuota:',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(data['quota'],
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Progres Pengerjaan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () => _updateProgress(data['progress'] - 5),
                  icon: const Icon(Icons.arrow_circle_down_outlined),
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                Text(
                  '${data['progress'].toInt()} %',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () => _updateProgress(data['progress'] + 5),
                  icon: const Icon(Icons.arrow_circle_up_outlined),
                  color: const Color.fromARGB(255, 4, 4, 4),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: _showSuccessPopup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0074D9),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
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
}
