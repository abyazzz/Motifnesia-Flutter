// ...new file...
import 'package:flutter/material.dart';
import '../../shared/layouts/app_layout.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const CheckoutPage({Key? key, required this.items}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _selectedShipping = 0;
  int _selectedPayment = 0;

  final List<Map<String, dynamic>> shippingOptions = [
    {'name': 'Reguler', 'price': 20000},
    {'name': 'Ekspedisi', 'price': 35000},
    {'name': 'Kilat', 'price': 50000},
  ];

  final List<String> paymentOptions = [
    'Saldo Motifnesia',
    'Mandiri Virtual Account',
    'BCA Virtual Account',
    'COD',
    'GoPay',
  ];

  int get subtotal => widget.items.fold(0, (s, it) => s + (it['price'] as int) * (it['qty'] as int));
  int get shippingPrice => shippingOptions[_selectedShipping]['price'] as int;
  int get total => subtotal + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      sidebar: const SizedBox.shrink(),
      content: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Address selector (simple)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6)]),
            child: Row(children: const [
              Expanded(child: Text('Alamat: Bojongsoang, Dayeuhkolot, Bandung, Jawa Barat, 46278')),
              Icon(Icons.keyboard_arrow_down)
            ]),
          ),
          const SizedBox(height: 12),

          // Product summary (compact)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Ringkasan Belanja', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...widget.items.map((it) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(children: [
                    Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)), child: const Icon(Icons.image, color: Colors.grey)),
                    const SizedBox(width: 8),
                    Expanded(child: Text('${it['title']} - ${it['qty']}x', style: const TextStyle(fontSize: 14))),
                    Text('Rp${(it['price'] as int) * (it['qty'] as int)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ]),
                );
              }).toList(),
            ]),
          ),

          const SizedBox(height: 12),

          // Shipping method (mobile simplified: name + price)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Metode Pengiriman', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...List.generate(shippingOptions.length, (i) {
                final opt = shippingOptions[i];
                return RadioListTile<int>(
                  value: i,
                  groupValue: _selectedShipping,
                  onChanged: (v) => setState(() => _selectedShipping = v ?? 0),
                  title: Text('${opt['name']} - Rp${opt['price']}'),
                );
              }),
            ]),
          ),

          const SizedBox(height: 12),

          // Payment methods
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...List.generate(paymentOptions.length, (i) {
                return RadioListTile<int>(
                  value: i,
                  groupValue: _selectedPayment,
                  onChanged: (v) => setState(() => _selectedPayment = v ?? 0),
                  title: Text(paymentOptions[i]),
                );
              }),
            ]),
          ),

          const SizedBox(height: 12),

          // Order cost breakdown
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(children: [
              Row(children: [const Expanded(child: Text('Total harga (barang):')), Text('Rp$subtotal')]),
              const SizedBox(height: 6),
              Row(children: [const Expanded(child: Text('Total Ongkos Kirim:')), Text('Rp$shippingPrice')]),
              const Divider(height: 18),
              Row(children: [const Expanded(child: Text('Total:', style: TextStyle(fontWeight: FontWeight.bold))), Text('Rp$total', style: const TextStyle(fontWeight: FontWeight.bold))]),
            ]),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6B4739), padding: const EdgeInsets.symmetric(vertical: 14)),
              onPressed: () {
                // placeholder: proceed to payment flow
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lanjut ke pembayaran (placeholder)')));
              },
              child: const Text('Bayar', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
// ...existing code...