import 'package:flutter/material.dart';
import '../widgets/animated_section.dart';
import '../widgets/section_title.dart';
import '../widgets/responsive_layout.dart'; // Memastikan helper responsive ter-import

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Cek status layar menggunakan helper yang kita buat sebelumnya
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return AnimatedSection(
      child: Container(
        // Padding luar menyusut dari 120 menjadi 24 jika di mobile
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 120,
          vertical: isMobile ? 60 : 80,
        ),
        child: Column(
          children: [
            const SectionTitle(title: "About Me"),

            SizedBox(height: isMobile ? 32 : 48),

            // Card Glassmorphism Pendukung Narasi
            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              // Padding dalam card sedikit diperkecil di mobile agar teks mendapat ruang lebih luas
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Text(
                "Saya adalah Flutter Developer dan Web Developer yang memiliki minat besar dalam pengembangan perangkat lunak serta teknologi informasi. Saat ini saya merupakan mahasiswa Program Studi S1 Rekayasa Perangkat Lunak di Telkom University, yang terus mengembangkan kemampuan melalui berbagai proyek akademik maupun proyek pribadi.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18, // Ukuran font adaptif
                  height: 1.8,
                  color: const Color(0xff94A3B8),
                ),
              ),
            ),

            SizedBox(height: isMobile ? 32 : 48),

            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              // Padding dalam card sedikit diperkecil di mobile agar teks mendapat ruang lebih luas
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Text(
                "Saya memiliki pengalaman dalam membangun aplikasi mobile, dashboard management, dan sistem informasi berbasis web menggunakan teknologi modern. Dalam setiap proyek, saya berfokus pada penulisan kode yang bersih (clean code), performa aplikasi yang optimal, serta menciptakan antarmuka yang modern dengan pengalaman pengguna (User Experience) yang intuitif dan interaktif.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18, // Ukuran font adaptif
                  height: 1.8,
                  color: const Color(0xff94A3B8),
                ),
              ),
            ),

            SizedBox(height: isMobile ? 32 : 48),

            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              // Padding dalam card sedikit diperkecil di mobile agar teks mendapat ruang lebih luas
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Text(
                "Selain memiliki dasar yang kuat dalam pemrograman dan pengembangan aplikasi, saya juga terbiasa bekerja secara kolaboratif dalam tim, mampu beradaptasi dengan cepat terhadap lingkungan baru, serta memiliki semangat belajar yang tinggi untuk mengikuti perkembangan teknologi. Saya senang mempelajari framework dan tools terbaru guna menghasilkan solusi yang efektif, efisien, dan mudah dikembangkan.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18, // Ukuran font adaptif
                  height: 1.8,
                  color: const Color(0xff94A3B8),
                ),
              ),
            ),

            SizedBox(height: isMobile ? 32 : 48),

            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              // Padding dalam card sedikit diperkecil di mobile agar teks mendapat ruang lebih luas
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Text(
                "Saat ini saya sedang mencari kesempatan magang (internship) maupun part-time di bidang pengembangan perangkat lunak agar dapat mengembangkan keterampilan secara profesional, memperluas pengalaman di industri, serta memberikan kontribusi nyata dalam membangun produk digital yang berkualitas.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18, // Ukuran font adaptif
                  height: 1.8,
                  color: const Color(0xff94A3B8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
