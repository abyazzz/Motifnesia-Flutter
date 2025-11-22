// lib/main.dart
import 'package:flutter/material.dart';

// ROUTES
import 'core/routes/app_routes.dart';

// PAGES
import 'modules/users/home_page.dart';
import 'modules/users/profile.dart';
import 'modules/users/edit_profile.dart';
import 'modules/users/riwayat_belanja.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motifnesia - Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),

      // halaman pertama yg dibuka
      initialRoute: AppRoutes.home,

      // daftar route
      routes: {
        AppRoutes.home: (_) => const HomePage(),
        AppRoutes.profile: (_) => const ProfilePage(),
        AppRoutes.editProfile: (_) => const EditProfilePage(),
        AppRoutes.riwayatBelanja: (_) => const RiwayatBelanjaPage(),
      },
    );
  }
}
