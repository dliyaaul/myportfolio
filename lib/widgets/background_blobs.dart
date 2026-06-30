import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BackgroundBlobs extends StatefulWidget {
  const BackgroundBlobs({super.key});

  @override
  State<BackgroundBlobs> createState() => _BackgroundBlobsState();
}

class _BackgroundBlobsState extends State<BackgroundBlobs>
    with TickerProviderStateMixin {
  late AnimationController _nebulaController;

  @override
  void initState() {
    super.initState();
    // Kontroller untuk pergerakan halus aura nebula di belakang
    _nebulaController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _nebulaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // =====================================================================
        // LAPISAN 1: AURA NEBULA GRADASI (Bergerak Lambat)
        // =====================================================================
        AnimatedBuilder(
          animation: _nebulaController,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  top: -100 + _nebulaController.value * 120,
                  left: -50 + _nebulaController.value * 60,
                  child: _buildNebulaBlob(
                    450,
                    const Color(0xff0EA5E9).withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  right: -100 + _nebulaController.value * 90,
                  bottom: 50 + _nebulaController.value * 150,
                  child: _buildNebulaBlob(
                    550,
                    const Color(0xff6366F1).withValues(alpha: 0.18),
                  ),
                ),
              ],
            );
          },
        ),

        // Efek Blur Global untuk melembutkan aura blob di atas
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 130, sigmaY: 130),
            child: Container(color: Colors.transparent),
          ),
        ),

        // =====================================================================
        // LAPISAN 2: PARTIKEL CAHAYA MENGAMBANG (Menggunakan Flutter Animate)
        // =====================================================================
        // Partikel 1 (Kiri Tengah)
        Positioned(
          top: 250,
          left: 150,
          child: _buildLightParticle(8, const Color(0xff38BDF8)),
        ),
        // Partikel 2 (Kanan Atas)
        Positioned(
          top: 150,
          right: 200,
          child: _buildLightParticle(12, const Color(0xffC084FC)),
        ),
        // Partikel 3 (Kiri Bawah)
        Positioned(
          bottom: 300,
          left: 250,
          child: _buildLightParticle(6, const Color(0xff34D399)),
        ),
        // Partikel 4 (Kanan Bawah)
        Positioned(
          bottom: 180,
          right: 350,
          child: _buildLightParticle(10, const Color(0xffFB7185)),
        ),
        // Partikel 5 (Tengah Atas dekat Navbar)
        Positioned(
          top: 90,
          left: 600,
          child: _buildLightParticle(5, Colors.white24),
        ),

        // =====================================================================
        // LAPISAN 3: EMOTE & IKON DEKORATIF MENGEPASKAN TEMA PORTFOLIO
        // =====================================================================

        // Roket Meluncur (Sisi Kanan Atas - Dekat area Profile/Hero)
        Positioned(
          top: 180,
          right: 120,
          child: _buildFloatingElement(
            text: "🚀",
            fontSize: 28,
            duration: 4.seconds,
            slideOffset: const Offset(5, -15), // Meluncur agak miring ke atas
          ),
        ),

        // Kilauan Bintang Kreativitas (Sisi Kiri Atas - Dekat Teks "Hello")
        Positioned(
          top: 140,
          left: 80,
          child: _buildFloatingElement(
            text: "✨",
            fontSize: 24,
            duration: 3.seconds,
            slideOffset: const Offset(0, -10),
          ),
        ),

        // Energi Petir/Speed (Sisi Kiri Bawah - Bagian About/Experience)
        Positioned(
          bottom: 400,
          left: 100,
          child: _buildFloatingElement(
            text: "⚡",
            fontSize: 26,
            duration: 4.5.seconds,
            slideOffset: const Offset(-8, -8),
          ),
        ),

        // Kopi Programmer (Sisi Kanan Bawah - Bagian Projects/Contact)
        Positioned(
          bottom: 250,
          right: 160,
          child: _buildFloatingElement(
            text: "☕",
            fontSize: 24,
            duration: 5.seconds,
            slideOffset: const Offset(0, -12),
          ),
        ),
      ],
    );
  }

  // Helper Pembuat Bulatan Nebula Dasar
  Widget _buildNebulaBlob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, Colors.transparent]),
      ),
    );
  }

  // Helper Pembuat Partikel Glow Kecil yang bernapas (Fade In/Out + Sine Wave)
  Widget _buildLightParticle(double size, Color color) {
    return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.4),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.6),
                blurRadius: size,
                spreadRadius: size / 2,
              ),
            ],
          ),
        )
        .animate(onComplete: (controller) => controller.repeat(reverse: true))
        .fadeIn(duration: 2.seconds)
        .then()
        .fadeOut(duration: 2.seconds)
        .moveY(
          begin: 0,
          end: -20,
          duration: 3.seconds,
          curve: Curves.easeInOutSine,
        );
  }

  // Helper Pembuat Emote Mengambang dengan Efek Goyang + Rotasi Halus
  Widget _buildFloatingElement({
    required String text,
    required double fontSize,
    required Duration duration,
    required Offset slideOffset,
  }) {
    return Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        )
        .animate(onComplete: (controller) => controller.repeat(reverse: true))
        .move(
          begin: Offset.zero,
          end: slideOffset,
          duration: duration,
          curve: Curves.easeInOutSine,
        )
        .custom(
          begin: -0.05, // Rotasi miring ke kiri sedikit (-3 derajat)
          end: 0.05, // Rotasi miring ke kanan sedikit (+3 derajat)
          duration: duration + 500.ms,
          curve: Curves.easeInOutSine,
          builder: (context, value, child) =>
              Transform.rotate(angle: value, child: child),
        );
  }
}
