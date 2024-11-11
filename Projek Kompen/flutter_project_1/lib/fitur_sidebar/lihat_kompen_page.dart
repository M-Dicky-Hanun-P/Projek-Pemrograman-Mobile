import 'package:flutter/material.dart';
import 'package:flutter_project_1/dashboard/home_page.dart';

class LihatKompenPage extends StatefulWidget {
  const LihatKompenPage({super.key});

  @override
  _LihatKompenPageState createState() => _LihatKompenPageState();
}

class _LihatKompenPageState extends State<LihatKompenPage> {
  final List<Map<String, String>> _tasks = [
    {
      'title': 'Bongkar pasang CPU',
      'name': 'Kadek Suarjuna',
      'type': '-',
      'hours': '4 jam kompen',
      'quota': '0/5',
      'action': 'Apply',
    },
    {
      'title': 'Ngoding website FE',
      'name': 'Kadek Suarjuna',
      'type': 'web developer',
      'hours': '4 jam kompen',
      'quota': '0/2',
      'action': 'Apply',
    },
    {
      'title': 'Membuat proposal',
      'name': 'Kadek Suarjuna',
      'type': 'system analyst',
      'hours': '4 jam kompen',
      'quota': '0/5',
      'action': 'Apply',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas Kompen yang Tersedia',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task['title'] ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task['name'] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bidang keahlian: ${task['type']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task['hours'] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kuota ${task['quota']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: task['action'] == 'Apply'
                                ? Colors.orange
                                : Colors.green,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              // Ubah action tombol ketika ditekan
                              task['action'] = task['action'] == 'Apply'
                                  ? 'Request'
                                  : 'Apply';
                            });

                            // Menampilkan pesan untuk tombol yang dipilih
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${task['action']} untuk ${task['title']}'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            // Notifikasi tambahan (commented out)
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //     content: Text('Silahkan kunjungi aplikasi pada website'),
                            //     duration: Duration(seconds: 2),
                            //   ),
                            // );
                          },
                          child: Text(
                            task['action'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
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
}
