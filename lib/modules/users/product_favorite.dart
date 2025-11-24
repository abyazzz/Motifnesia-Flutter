// ...existing code...
import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';

class ProductFavoritePage extends StatefulWidget {
  const ProductFavoritePage({Key? key}) : super(key: key);

  @override
  State<ProductFavoritePage> createState() => _ProductFavoritePageState();
}

class _ProductFavoritePageState extends State<ProductFavoritePage> {
  List<_FavItem> favorites = List.generate(
    5,
    (i) => _FavItem(
      id: i + 1,
      title: 'Batik Favorit ${i + 1}',
      price: 250000 + i * 20000,
    ),
  );

  void _remove(int idx) => setState(() => favorites.removeAt(idx));

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      sidebar: const SizedBox.shrink(),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemCount: favorites.length,
          itemBuilder: (context, idx) {
            final it = favorites[idx];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image.asset(
                      'lib/assets/67faed38a76e7.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          it.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Rp${it.price}',
                          style: const TextStyle(color: Colors.brown),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                    onPressed: () => _remove(idx),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FavItem {
  final int id;
  final String title;
  final int price;
  _FavItem({required this.id, required this.title, required this.price});
}
// ...existing code...