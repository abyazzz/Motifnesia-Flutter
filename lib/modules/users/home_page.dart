// ...existing code...
import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';
import 'product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Map<String, String>> get _products => List.generate(
        10,
        (i) => {
          'id': '${i + 1}',
          'title': 'Baju Batik ${i + 1}',
          'price': 'Rp ${(i + 1) * 100000},00',
        },
      );

  @override
  Widget build(BuildContext context) {
    final products = _products;

    // pass a dummy sidebar (not used in mobile)
    return AppLayout(
      sidebar: const SizedBox.shrink(),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            // filter row (like screenshot)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Expanded(child: _filterButton('Kategori')),
                  const SizedBox(width: 8),
                  Expanded(child: _filterButton('Harga')),
                  const SizedBox(width: 8),
                  Expanded(child: _filterButton('Lokasi')),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // products grid (2 columns mobile)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 200 / 290, // width/height proportion
                ),
                itemBuilder: (context, idx) {
                  final p = products[idx];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetail(
                            id: int.parse(p['id']!),
                            title: p['title']!,
                            price: p['price']!,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            child: Container(
                              height: 170,
                              color: Colors.grey.shade100,
                              child: const Center(child: Icon(Icons.image, size: 56, color: Colors.grey)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 4),
                            child: Text(
                              p['title']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 4),
                            child: Text(
                              p['price']!,
                              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Row(
                              children: const [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text('5.0', style: TextStyle(fontSize: 12)),
                              ],
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

  Widget _filterButton(String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6B4739),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 8),
        elevation: 0,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 6),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}
// ...existing code...