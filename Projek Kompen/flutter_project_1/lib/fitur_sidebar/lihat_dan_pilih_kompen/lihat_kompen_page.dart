import 'package:flutter/material.dart';
import 'package:flutter_project_1/dashboard/home_page.dart';
import 'detail_tugas_yang_tersedia.dart';

class LihatKompenPage extends StatefulWidget {
  const LihatKompenPage({super.key});

  @override
  _LihatKompenPageState createState() => _LihatKompenPageState();
}

class _LihatKompenPageState extends State<LihatKompenPage> {
  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'Bongkar pasang CPU',
      'name': 'Kadek Suarjuna',
      'type': '-',
      'hours': '4 jam kompen',
      'quota': '0/5',
      'maxQuota': 5,
      'isRequested': false, // Status awal
    },
    {
      'title': 'Membuat proposal penelitian',
      'name': 'Kadek Suarjuna',
      'type': 'system analyst',
      'hours': '4 jam kompen',
      'quota': '5/5',
      'maxQuota': 5,
      'isRequested': false, // Status awal
    },
  ];

  bool isFull(String quota) {
    final splitQuota = quota.split('/');
    final current = int.parse(splitQuota[0]);
    final max = int.parse(splitQuota[1]);
    return current >= max;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tugas yang Tersedia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage(
                        username: 'mahasiswa',
                      )),
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
            final quotaFull = isFull(task['quota']);
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
                      task['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      task['name'],
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
                      task['hours'],
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
                            backgroundColor: task['isRequested']
                                ? const Color.fromARGB(255, 223, 201, 0)
                                : const Color(0xFF33B04A),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: quotaFull || task['isRequested']
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailTugasYangTersediaPage(
                                        task: task, // Kirim data tugas
                                        onStatusChanged: (bool status) {
                                          setState(() {
                                            task['isRequested'] =
                                                status; // Perbarui status
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                          child: Text(
                            task['isRequested'] ? 'Request' : 'Apply',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
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
