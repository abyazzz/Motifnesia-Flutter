// ...existing code...
import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';
import 'shopping_cart.dart';
import 'product_favorite.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  final String title;
  final String price;

  const ProductDetail({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      sidebar: const SizedBox.shrink(),
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'lib/assets/67faed38a76e7.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 12),
            const Text(
              'Deskripsi singkat produk. Ganti dengan data real dari API nanti.',
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B4739),
                    ),
                    onPressed: () {
                      // navigate to shopping cart page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ShoppingCartPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Tambahkan ke Keranjang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6B4739),
                    side: const BorderSide(color: Color(0xFF6B4739)),
                  ),
                  onPressed: () {
                    // navigate to favorite page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProductFavoritePage(),
                      ),
                    );
                  },
                  child: const Icon(Icons.favorite_border),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// ...existing code...