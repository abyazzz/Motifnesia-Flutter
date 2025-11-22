// ...new file...
import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  List<Map<String, String>> get _data => [
        {'title': 'Pesanan Anda Sedang Dikonfirmasi', 'subtitle': 'Batik Motifnesia - M - 1x', 'price': 'Rp. 800.000'},
        {'title': 'Pesanan Anda Sedang Diproses', 'subtitle': 'Batik Motifnesia - M - 1x', 'price': 'Rp. 800.000'},
        {'title': 'Pesanan Anda Sedang Dikemas', 'subtitle': 'Batik Motifnesia - M - 1x', 'price': 'Rp. 800.000'},
        {'title': 'Pesanan Anda Sedang Diantar', 'subtitle': 'Batik Motifnesia - M - 1x', 'price': 'Rp. 800.000'},
        {'title': 'Pesanan Anda Sedang Sampai', 'subtitle': 'Batik Motifnesia - M - 1x', 'price': 'Rp. 800.000'},
      ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      sidebar: const SizedBox.shrink(),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: ListView.separated(
          itemCount: _data.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, idx) {
            final item = _data[idx];
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Text(item['subtitle']!, style: const TextStyle(color: Colors.black87)),
                    const SizedBox(height: 6),
                    Text(item['price']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
// ...existing code...