import 'package:flutter/material.dart';
import 'package:sikomti_app/proses_log&res/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nomorTeleponController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _selectedProgramStudi;
  String? _selectedTahunMasuk;

  final List<String> _programStudiList = [
    'D4 TI',
    'D4 SIB',
    'D2 PPLS'
  ];

  final List<String> _tahunMasukList = ['2021', '2022', '2023', '2024'];

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Belum ada Database')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header with curve
          Expanded(
            flex: 1,
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                width: double.infinity,
                color: const Color(0xFF0E1F43),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/SIKOMTI.png',
                          height: 60,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'REGISTRASI MAHASISWA',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Form Registration
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormField(
                        controller: _nimController,
                        label: 'NIM',
                        hintText: 'Masukkan NIM',
                        validator: (value) => value?.isEmpty ?? true
                            ? 'NIM tidak boleh kosong'
                            : null,
                      ),
                      _buildFormField(
                        controller: _namaLengkapController,
                        label: 'Nama Lengkap',
                        hintText: 'Masukkan nama lengkap',
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Nama lengkap tidak boleh kosong'
                            : null,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tahun Masuk',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedTahunMasuk,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        hint: const Text('Pilih Tahun Masuk'),
                        items: _tahunMasukList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedTahunMasuk = newValue;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Tahun masuk harus dipilih' : null,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Program Studi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.8, // 90% dari lebar layar
                        child: DropdownButtonFormField<String>(
                          value: _selectedProgramStudi,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          hint: const Text('Pilih Program Studi'),
                          items: _programStudiList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedProgramStudi = newValue;
                            });
                          },
                          validator: (value) => value == null
                              ? 'Program studi harus dipilih'
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildFormField(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'Masukkan email',
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Email tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      _buildFormField(
                        controller: _nomorTeleponController,
                        label: 'Nomor Telepon',
                        hintText: 'Masukkan nomor telepon',
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Nomor telepon tidak boleh kosong'
                            : null,
                      ),
                      _buildFormField(
                        controller: _usernameController,
                        label: 'Username',
                        hintText: 'Masukkan username',
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Username tidak boleh kosong'
                            : null,
                      ),
                      _buildFormField(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Masukkan password',
                        obscureText: !_showPassword,
                        validator: (value) => value?.isEmpty ?? true
                            ? 'Password tidak boleh kosong'
                            : null,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _showPassword,
                            onChanged: (value) {
                              setState(() {
                                _showPassword = value ?? false;
                              });
                            },
                          ),
                          const Text('Tampilkan Password'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'REGISTRASI',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Sudah punya akun? '),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // // Footer
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.all(15),
          //   decoration: const BoxDecoration(
          //     color: Color(0xFF0E1F43),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(20),
          //       topRight: Radius.circular(20),
          //     ),
          //   ),
          //   child: const Center(
          //     child: Text(
          //       '2024© Sistem Kompensasi Jurusan',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 12,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    bool obscureText = false,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: hintText,
          ),
          validator: validator,
        ),
      ],
    );
  }
}

// Custom ClipPath untuk header melengkung
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
