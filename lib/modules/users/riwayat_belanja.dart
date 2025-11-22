import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';

class RiwayatBelanjaPage extends StatelessWidget {
  const RiwayatBelanjaPage({super.key});

  // Dummy data riwayat belanja
  List<Map<String, String>> get _riwayat => [
    {
      "produk": "Baju Batik Motif Parang",
      "tanggal": "12 Nov 2025",
      "harga": "Rp 150.000",
      "status": "Selesai",
    },
    {
      "produk": "Batik Mega Mendung",
      "tanggal": "03 Nov 2025",
      "harga": "Rp 200.000",
      "status": "Diproses",
    },
    {
      "produk": "Kemeja Batik Premium",
      "tanggal": "25 Okt 2025",
      "harga": "Rp 300.000",
      "status": "Dibatalkan",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      sidebar: const SizedBox.shrink(),
      content: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Riwayat Belanja",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: _riwayat.length,
                itemBuilder: (context, i) {
                  final item = _riwayat[i];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["produk"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text("Tanggal: ${item["tanggal"]}"),
                          Text("Harga: ${item["harga"]}"),

                          const SizedBox(height: 8),

                          _statusChip(item["status"]!),

                          const SizedBox(height: 12),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Lihat Detail"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusChip(String status) {
    Color color;
    if (status == "Selesai") {
      color = Colors.green;
    } else if (status == "Diproses") {
      color = Colors.orange;
    } else {
      color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
