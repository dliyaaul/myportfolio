import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Efek teks gradasi yang memukau
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color(0xffF8FAFC),
              Color(0xff94A3B8),
            ], // Putih ke Abu-abu premium
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w900, // Sangat tebal
              color: Colors.white, // Wajib warna putih agar shader berfungsi
              letterSpacing: -0.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Garis dekoratif bergradasi warna neon
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xff38BDF8), Color(0xff3B82F6)],
            ),
          ),
        ),
      ],
    );
  }
}
