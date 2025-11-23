// ...existing code...
import 'package:flutter/material.dart';
import '../../modules/users/home_page.dart';
import '../../modules/users/profile.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  Color get _brown => const Color(0xFF6B4739);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: _brown,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
      onTap: (i) {
        if (i == 0) {
          // Home
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        } else if (i == 4) {
          // Profile
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProfilePage()),
          );
        } else {
          // tombol lain belum tersedia
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Halaman belum tersedia")),
          );
        }
      },
    );
  }
}

// ...existing code...
