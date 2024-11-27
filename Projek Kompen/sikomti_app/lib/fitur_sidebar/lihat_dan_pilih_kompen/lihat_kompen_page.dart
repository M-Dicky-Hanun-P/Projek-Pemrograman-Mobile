import 'package:flutter/material.dart';
import 'package:sikomti_app/dashboard/home_page.dart';
import 'detail_tugas_yang_tersedia.dart';

class LihatKompenPage extends StatefulWidget {
  const LihatKompenPage({super.key});

  @override
  _LihatKompenPageState createState() => _LihatKompenPageState();
}

class _LihatKompenPageState extends State<LihatKompenPage> {
  final List<Map<String, dynamic>> _tasks = [
    {
      'nama_penugasan': 'Bongkar pasang CPU',
      'jenis_penugasan_kompen': 'Bongkar pasang CPU',
      'deskripsi':
          'Melakukan instalasi harddisk yang barusan saya beli ke dalam CPU saya, sekaligus membersihkan CPUnya. Lakukan cek pada tiap komponen apakah ada yang perlu diganti juga atau tidak.',
      'pemberi_tugas': 'Kadek Suarjuna',
      'bidang_keahlian': '-',
      'jam_kompen': '4 jam',
      'kuota': '0/5',
      'maxQuota': 5,
      'isRequested': false,
    },
    {
      'nama_penugasan': 'Ngoding website FE',
      'jenis_penugasan_kompen': 'Pemrograman',
      'deskripsi':
          'Mengerjakan coding FE, menggunakan Laravel 11 dan membuat tampilan di dalam file .blade nya.',
      'pemberi_tugas': 'Kadek Suarjuna',
      'bidang_keahlian': 'PHP Laravel',
      'jam_kompen': '12 jam',
      'kuota': '2/5',
      'maxQuota': 5,
      'isRequested': false,
    },
    {
      'nama_penugasan': 'Membuat proposal penelitian',
      'jenis_penugasan_kompen': 'Penelitian',
      'deskripsi':
          'Melakukan penelitian berdasarkan judul penelitian yang sudah saya buat, yaitu mengenai tech winter di perusahaan terutama di perusahaan IT.',
      'pemberi_tugas': 'Kadek Suarjuna',
      'bidang_keahlian': '-',
      'jam_kompen': '4 jam',
      'kuota': '5/5',
      'maxQuota': 5,
      'isRequested': false,
    },
  ];

  bool isFull(String quota) {
    final splitQuota = quota.split('/');
    final current = int.parse(splitQuota[0]);
    final max = int.parse(splitQuota[1]);
    return current >= max;
  }

  void updateTaskStatus(int index, bool isRequested) {
    setState(() {
      _tasks[index]['isRequested'] = isRequested;
    });
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
        padding: const EdgeInsets.all(17.0),
        child: ListView.builder(
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            final quotaFull = isFull(task['kuota']);
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
                      task['nama_penugasan'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bidang keahlian: ${task['bidang_keahlian']}',
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
                          'Kuota ${task['kuota']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: quotaFull
                                ? const Color(
                                    0xFFDFD700)
                                : const Color(
                                    0xFF33B04A), // Warna untuk tombol "Apply"
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10.0,
                            ),
                            minimumSize: const Size(100, 40), // Ukuran tombol
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: (quotaFull || task['isRequested'])
                              ? null
                              : () async {
                                  final isRequested = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailTugasYangTersediaPage(
                                        task: task,
                                        onStatusChanged: (status) {
                                          // Memperbarui status di halaman LihatKompenPage
                                          updateTaskStatus(index, status);
                                        },
                                      ),
                                    ),
                                  );

                                  if (isRequested == true) {
                                    updateTaskStatus(index, true);
                                  }
                                },
                          child: Text(
                            quotaFull
                                ? 'Full'
                                : (task['isRequested'] ? 'Requested' : 'Apply'),
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
