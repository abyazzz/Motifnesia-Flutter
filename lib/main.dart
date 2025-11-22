// lib/main.dart
import 'package:flutter/material.dart';
import 'core/routes/app_routes.dart';
import 'modules/users/home_page.dart';

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
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => HomePage(),
        // add more routes later
      },
    );
  }
}
