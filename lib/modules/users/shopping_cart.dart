// ...existing code...
import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';
import 'checkout_page.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<_CartItem> items = List.generate(
    5,
    (i) => _CartItem(
      id: i + 1,
      title: 'Batik Arya Timur - BIRU, SS ${i + 1}',
      price: 300000 + i * 50000,
      qty: 1,
    ),
  );

  void _inc(int idx) => setState(() => items[idx].qty++);
  void _dec(int idx) {
    if (items[idx].qty > 1) setState(() => items[idx].qty--);
  }

  int get total => items.fold(0, (s, it) => s + it.price * it.qty);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      sidebar: const SizedBox.shrink(),
      content: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 140),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                itemCount: items.length,
                itemBuilder: (context, idx) {
                  final it = items[idx];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1CFA0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () => _dec(idx),
                                ),
                                Text(
                                  '${it.qty}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () => _inc(idx),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: 90,
                              child: Text(
                                'Rp${it.price * it.qty}',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (_) {}),
                        const Text('Voucher'),
                        const Spacer(),
                        Text(
                          'Total: Rp${total}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6B4739),
                            ),
                            onPressed: () {
                              // prepare simple payload and navigate to checkout
                              final payload = items
                                  .map(
                                    (it) => {
                                      'id': it.id,
                                      'title': it.title,
                                      'price': it.price,
                                      'qty': it.qty,
                                    },
                                  )
                                  .toList();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CheckoutPage(items: payload),
                                ),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Check Out',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartItem {
  final int id;
  final String title;
  final int price;
  int qty;
  _CartItem({
    required this.id,
    required this.title,
    required this.price,
    this.qty = 1,
  });
}
// ...existing code...