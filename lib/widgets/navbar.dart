import 'dart:ui';
import 'package:flutter/material.dart';
import '../controllers/scroll_controller_provider.dart';
import 'responsive_layout.dart'; // Import helper yang kita buat tadi
import 'package:url_launcher/url_launcher.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

Future<void> downloadCV() async {
  final uri = Uri.parse('/cv/CV_MuhammadDliyaaul.pdf');

  if (!await launchUrl(uri, webOnlyWindowName: '_blank')) {
    throw Exception('Tidak dapat membuka CV');
  }
}

class _NavbarState extends State<Navbar> {
  String hoveredItem = '';

  @override
  Widget build(BuildContext context) {
    // Cek apakah layar berukuran mobile
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 85,
          // Padding mengecil jika di mobile
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80),
          decoration: BoxDecoration(
            color: const Color(0xff0F172A).withValues(alpha: 0.7),
            border: const Border(
              bottom: BorderSide(color: Color(0xff1E293B), width: 1),
            ),
          ),
          child: Row(
            children: [
              // Logo Kiri
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xff38BDF8), Color(0xff3B82F6)],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "MD",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Text(
                    "Muhammad Dliyaaul.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Jika MOBILE, tampilkan tombol Hamburger Menu untuk membuka Drawer
              if (isMobile)
                IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    // Membuka endDrawer dari Scaffold halaman utama
                    Scaffold.of(context).openEndDrawer();
                  },
                )
              else ...[
                // Jika DESKTOP/TABLET, tampilkan menu normal
                Row(
                  children: [
                    _navItem(
                      "About",
                      () => ScrollControllerProvider.scrollToSection(
                        ScrollControllerProvider.aboutKey,
                      ),
                    ),
                    _navItem(
                      "Experience",
                      () => ScrollControllerProvider.scrollToSection(
                        ScrollControllerProvider.experienceKey,
                      ),
                    ),
                    _navItem(
                      "Projects",
                      () => ScrollControllerProvider.scrollToSection(
                        ScrollControllerProvider.projectKey,
                      ),
                    ),
                    _navItem(
                      "Contact",
                      () => ScrollControllerProvider.scrollToSection(
                        ScrollControllerProvider.contactKey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 32),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff38BDF8), Color(0xff3B82F6)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: downloadCV,
                    icon: const Icon(Icons.download_rounded, size: 18),
                    label: const Text(
                      "Download CV",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String title, VoidCallback onTap) {
    final isHovered = hoveredItem == title;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hoveredItem = title),
      onExit: (_) => setState(() => hoveredItem = ''),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isHovered
                      ? const Color(0xff38BDF8)
                      : const Color(0xff94A3B8),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isHovered ? 24 : 0,
                height: 2,
                decoration: BoxDecoration(
                  color: const Color(0xff38BDF8),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
