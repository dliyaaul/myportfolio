import 'package:flutter/material.dart';

class TimelineItem extends StatelessWidget {
  final String year;
  final String title;
  final String description;
  final IconData icon;

  const TimelineItem({
    super.key,
    required this.year,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sisi Kiri: Tahun dengan style modern & warna pudar maskulin
        SizedBox(
          width: 90,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              year,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xff94A3B8), // Slate 400
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),

        // Sisi Tengah: Garis Timeline Estetik bercahaya
        Column(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff38BDF8),
                    Color(0xff3B82F6),
                  ], // Cyan ke Blue
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff38BDF8).withValues(alpha: 0.4),
                    blurRadius: 18,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            Container(
              width: 2,
              height: 130,
              decoration: BoxDecoration(
                // Jarak disesuaikan agar pas dengan padding luar
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff3B82F6),
                    const Color(0xff3B82F6).withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 24),

        // Sisi Kanan: Konten Kartu Pengalaman
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(bottom: 32),
            decoration: BoxDecoration(
              color: const Color(
                0xff1E293B,
              ).withValues(alpha: 0.6), // Transparan halus
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(
                  0xff334155,
                ).withValues(alpha: 0.5), // Subtle Border
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(
                      0xff94A3B8,
                    ), // Teks deskripsi lebih redup agar hierarki visual bagus
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
