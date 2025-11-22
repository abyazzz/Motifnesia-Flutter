// ...existing code...
import 'package:flutter/material.dart';
import '../components/navbar.dart';
import '../components/bottom_nav.dart';

class AppLayout extends StatelessWidget {
  final Widget sidebar;
  final Widget content;
  const AppLayout({Key? key, required this.sidebar, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: AppNavbar(),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (isMobile) {
          return SafeArea(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  children: [
                    Expanded(child: content),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1160),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: sidebar),
                  const SizedBox(width: 12),
                  Expanded(flex: 3, child: content),
                ],
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: isMobile ? const BottomNav() : null,
    );
  }
}
// ...existing code...