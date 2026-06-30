import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio - Muhammad Dliyaaul Haq Shidqey',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness
            .dark, // Memastikan framework mendeteksi mode gelap bawaan
        scaffoldBackgroundColor: Colors.transparent,
        canvasColor: const Color(0xff0F172A),
        textTheme:
            GoogleFonts.interTextTheme(
              // Mengubah ke Font 'Inter' (Standar desain software premium modern)
              Theme.of(context).textTheme,
            ).apply(
              bodyColor: const Color(
                0xffF8FAFC,
              ), // Off-white premium agar tidak terlalu silau di mata
              displayColor: Colors.white,
            ),
      ),
      home: const HomePage(),
    );
  }
}
