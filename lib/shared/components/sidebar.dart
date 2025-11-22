// lib/components/sidebar.dart
import 'package:flutter/material.dart';

class FilterSidebar extends StatelessWidget {
  final VoidCallback? onFilter;
  const FilterSidebar({Key? key, this.onFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // white rounded card with shadow like screenshot
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0,4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filter Kategori', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          const Text('Gender', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          _buildDropdown(),
          const SizedBox(height: 12),
          const Text('Jenis Lengan', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          _buildDropdown(),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onFilter,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A352B), // same brown
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Filter', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 18),
          const Text('Filter Harga', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _priceLine('200.000 - 400.000'),
          _priceLine('400.000 - 600.000'),
          _priceLine('600.000 - 800.000'),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: 'Semua',
          items: const [
            DropdownMenuItem(value: 'Semua', child: Text('Semua')),
            DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
            DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
          ],
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget _priceLine(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(text, style: const TextStyle(color: Colors.black87)),
    );
  }
}
