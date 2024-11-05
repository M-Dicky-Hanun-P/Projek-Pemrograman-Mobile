import 'package:flutter/material.dart';
import 'package:flutter_project_1/dashboard/home_page.dart';

class LihatKompenPage extends StatefulWidget {
  @override
  _LihatKompenPageState createState() => _LihatKompenPageState();
}

class _LihatKompenPageState extends State<LihatKompenPage> {
  final List<Map<String, String>> _tasks = [
    {
      'no': '1',
      'name': 'Fifi',
      'type': 'Penelitian',
      'description': 'Penelitian Kecerdasan Buatan Metode Regresi',
      'quota': '5',
      'hours': '10',
      'status': 'Dibuka',
      'duration': '28 Okt - 24 Nov 2024',
    },
    {
      'no': '2',
      'name': 'Gale',
      'type': 'Teknis',
      'description': 'Menata ruang laboratorium 7/11',
      'quota': '3',
      'hours': '8',
      'status': 'Ditutup',
      'duration': '20 Okt - 22 Okt 2024',
    },
    {
      'no': '3',
      'name': 'Adel',
      'type': 'Programmer',
      'description': 'Membuat Tampilan Dashboard dengan Laravel 11',
      'quota': '2',
      'hours': '10',
      'status': 'Dibuka',
      'duration': '4 Nov - 10 Nov 2024',
    },
  ];

  late List<Map<String, String>> _filteredTasks;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredTasks = _tasks;
  }

  void _filterTasks(String query) {
    setState(() {
      _filteredTasks = query.isEmpty
          ? _tasks
          : _tasks.where((task) {
              return (task['name']
                          ?.toLowerCase()
                          .contains(query.toLowerCase()) ?? 
                      false) ||
                  (task['type']?.toLowerCase().contains(query.toLowerCase()) ??
                      false) ||
                  (task['description']
                          ?.toLowerCase()
                          .contains(query.toLowerCase()) ?? 
                      false);
            }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lihat dan Pilih Kompen',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lihat dan Pilih Tugas Kompen',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E1F43),
                      ),
                    ),
                    const Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text("Show"),
                            const SizedBox(width: 5),
                            DropdownButton<int>(
                              value: 10,
                              items: [10, 25, 50, 100].map((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                            const Text("entries"),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            onChanged: (value) {
                              _searchQuery = value;
                              _filterTasks(_searchQuery);
                            },
                            decoration: InputDecoration(
                              labelText: 'Search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Data Table
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 16.0,
                    horizontalMargin: 16.0,
                    headingRowColor: MaterialStateProperty.resolveWith(
                        (states) => const Color.fromARGB(255, 196, 228, 253)),
                    columns: const [
                      DataColumn(label: Text('No')),
                      DataColumn(label: Text('Nama Mahasiswa')),
                      DataColumn(label: Text('Jenis Tugas Kompen')),
                      DataColumn(label: Text('Deskripsi')),
                      DataColumn(label: Text('Quota')),
                      DataColumn(label: Text('Jam Kompen')),
                      DataColumn(label: Text('Status')),
                      DataColumn(label: Text('Waktu Pengerjaan')),
                      DataColumn(label: Text('Aksi')),
                    ],
                    rows: _filteredTasks.map((task) {
                      return DataRow(
                        cells: [
                          DataCell(Text(task['no']!)),
                          DataCell(Text(task['name']!)),
                          DataCell(Text(task['type']!)),
                          DataCell(Text(task['description']!)),
                          DataCell(Text(task['quota']!)),
                          DataCell(Text(task['hours']!)),
                          DataCell(Text(task['status']!)),
                          DataCell(Text(task['duration']!)),
                          DataCell(
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text(
                                'Apply',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            // Footer
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
      ),
    );
  }
}
