import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);
    // Kita pisahkan bagian konten teks dan foto agar bisa disusun ulang secara dinamis
    final Widget infoContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "👋 Hello, I'm",
          style: TextStyle(
            fontSize: isMobile ? 16 : 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xff38BDF8),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Muhammad Dliyaa'ul Haq\nShidqey",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 36 : 54,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 40,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "Flutter Developer 📱",
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff818CF8),
                ),
              ),
              TypewriterAnimatedText(
                "Web Developer 🌐",
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff34D399),
                ),
              ),
              TypewriterAnimatedText(
                "UI/UX Enthusiast 🎨",
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFB7185),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Statistik disesuaikan agar rapi di HP
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            _stat("3+", "Projects", isMobile),
            SizedBox(width: isMobile ? 24 : 48),
            _stat("10+", "Tech", isMobile),
            SizedBox(width: isMobile ? 24 : 48),
            _stat("5+", "Years", isMobile),
          ],
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff3B82F6),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            "Let's Talk ✨",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    final Widget profileImage = Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xff38BDF8), Color(0xff818CF8)],
          ),
        ),
        child: CircleAvatar(
          radius: isMobile ? 110 : 160,
          backgroundColor: const Color(0xff0F172A),
          child: CircleAvatar(
            radius: isMobile ? 105 : 154,
            backgroundImage: const AssetImage(
              "assets/project/profile_image.jpg",
            ),
          ),
        ),
      ),
    );

    return Container(
          // Tinggi fleksibel (wrap_content) pada mobile, solid pada desktop
          height: isMobile ? null : 750,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 120,
            vertical: isMobile ? 60 : 0,
          ),
          // STRATEGI UTAMA: Jika layar mobile gunakan Column, jika desktop gunakan Row
          child: isMobile
              ? Column(
                  children: [
                    profileImage,
                    const SizedBox(height: 40),
                    infoContent,
                  ],
                )
              : Row(
                  children: [
                    Expanded(flex: 6, child: infoContent),
                    Expanded(flex: 4, child: profileImage),
                  ],
                ),
        )
        .animate()
        .fadeIn(duration: 800.ms)
        .slideY(begin: 0.08, curve: Curves.easeOutCubic);
  }

  Widget _stat(String value, String title, bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isMobile ? 24 : 36,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: const TextStyle(color: Color(0xff64748B), fontSize: 13),
        ),
      ],
    );
  }
}
