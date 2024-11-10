import 'package:flutter/material.dart';
import 'package:flutter_project_1/dashboard/home_page.dart';

const Map<String, dynamic> taskDetail = {
  'title': 'Bongkar Pasang CPU',
  'name': 'Kadek Suarjuna',
  'field': 'Bidang keahlian',
  'hours': '4 jam kompen',
  'quota': 'Kuota 0/5',
};

class UpdateTugasPage extends StatefulWidget {
  @override
  _UpdateTugasPageState createState() => _UpdateTugasPageState();
}

class _UpdateTugasPageState extends State<UpdateTugasPage> {
  final List<Map<String, String>> _tasks = [
    {
      'no': '1',
      'name': 'Mungki Astiningrum, ST., M.Kom',
      'type': 'Penelitian',
      'status': 'Selesai',
      'hours': '80',
      'duration': '28 Oktober 2024 - 29 November 2024',
      'progress': 'Sprint ke-3',
    },
    {
      'no': '2',
      'name': 'Kadek Suryajana',
      'type': 'Teknis',
      'status': 'Belum',
      'hours': '10',
      'duration': '20 Oktober 2024 - 22 Oktober 2024',
      'progress': 'Sprint ke-5',
    },
  ];

  String _searchQuery = '';

  void _filterTasks(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _showNotification(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Silahkan kunjungi aplikasi pada website"),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _tasks.where((task) {
      return task['name']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          task['type']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Progres Tugas On The GO!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0E1F43),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePage(username: 'mahasiswa')),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Enhanced Card Styling for Task Details
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: const Color.fromARGB(255, 150, 191, 255),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskDetail['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(taskDetail['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    const SizedBox(height: 4),
                    Text(
                      '${taskDetail['field']} - ${taskDetail['hours']}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          taskDetail['quota']!,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 61, 61, 61),
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () => _showNotification(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 66, 163, 69),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Data Table Header and Search
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Show'),
                    const SizedBox(width: 8),
                    DropdownButton<int>(
                      value: 10,
                      items: [10, 25, 50].map((value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (value) => _showNotification(context),
                    ),
                    const SizedBox(width: 8),
                    const Text('entries'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => _showNotification(context),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color.fromARGB(255, 240, 169, 3),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.print, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Cetak Hasil Kompen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Search Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 180,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _filterTasks,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  columns: const [
                    DataColumn(label: Text('NO')),
                    DataColumn(label: Text('PEMBERI KOMPEN')),
                    DataColumn(label: Text('JENIS TUGAS KOMPEN')),
                    DataColumn(label: Text('STATUS')),
                    DataColumn(label: Text('JAM KOMPEN')),
                    DataColumn(label: Text('WAKTU PENGERJAAN')),
                    DataColumn(label: Text('PROGRES')),
                    DataColumn(label: Text('AKSI')),
                  ],
                  rows: filteredTasks.map((task) {
                    return DataRow(
                      color: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (filteredTasks.indexOf(task) % 2 == 0) {
                            return const Color.fromARGB(255, 239, 239, 239);
                          }
                          return Colors.white;
                        },
                      ),
                      cells: [
                        DataCell(Text(task['no']!)),
                        DataCell(Text(task['name']!)),
                        DataCell(Text(task['type']!)),
                        DataCell(Text(task['status']!)),
                        DataCell(Text(task['hours']!)),
                        DataCell(Text(task['duration']!)),
                        DataCell(Text(task['progress']!)),
                        DataCell(Row(
                          children: [
                            IconButton(
                              onPressed: () => _showNotification(context),
                              icon: const Icon(Icons.edit, color: Colors.green),
                            ),
                            IconButton(
                              onPressed: () => _showNotification(context),
                              icon: const Icon(Icons.print, color: Colors.blue),
                            ),
                          ],
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            // Footer with Improved Styling
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
