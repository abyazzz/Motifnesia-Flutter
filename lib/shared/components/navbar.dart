// ...existing code...
import 'package:flutter/material.dart';
import '../../modules/users/notifications_page.dart';
import '../../modules/users/shopping_cart.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const AppNavbar({Key? key, this.height = 72}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Outer container to mimic "floating with margin & rounded"
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFF5A352B), // brown like image
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Brand
            const Text(
              'Motifnesia',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(width: 16),

            // Search field
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Input box container to match style in screenshot
                  Expanded(
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const TextField(
                        decoration: InputDecoration(
                          isCollapsed: true,
                          border: InputBorder.none,
                          hintText: 'cari..',
                          contentPadding: EdgeInsets.symmetric(vertical: 6),
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // bell (notifications)
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NotificationsPage()),
                      );
                    },
                    icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                  ),

                  const SizedBox(width: 8),

                  // cart (shopping cart)
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ShoppingCartPage()),
                      );
                    },
                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
// ...existing code...