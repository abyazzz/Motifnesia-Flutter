import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Saya")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Foto Profil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_dummy.png'),
              ),
            ),

            const SizedBox(height: 20),

            // Informasi User
            const Text(
              "Informasi Akun",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _buildInfoRow("Nama", "Khuzaivan"),
            _buildInfoRow("Email", "zai@email.com"),
            _buildInfoRow("No HP", "081234534662"),
            _buildInfoRow("Alamat", "Ciamis, Jawa Barat"),

            const SizedBox(height: 30),

            // Tombol Aksi
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/editProfile");
              },
              child: const Text("Edit Profile"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/riwayatBelanja");
              },
              child: const Text("Riwayat Belanja"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            "$title : ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
