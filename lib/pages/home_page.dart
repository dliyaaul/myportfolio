import 'package:flutter/material.dart';
import '../controllers/scroll_controller_provider.dart'; // Pastikan import ini benar
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/experience_section.dart';
import '../sections/project_section.dart';
import '../sections/contact_section.dart';
import '../widgets/navbar.dart';
import '../widgets/background_blobs.dart';
import '../widgets/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. Buat instance ScrollController
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 2. Hubungkan controller lokal ini ke Provider kamu agar bisa diakses oleh Navbar
    ScrollControllerProvider.controller = _scrollController;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ResponsiveLayout.isMobile(context)
          ? Drawer(
              backgroundColor: const Color(0xff0F172A),
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 40,
                  ),
                  children: [
                    _buildDrawerItem(
                      context,
                      "About",
                      ScrollControllerProvider.aboutKey,
                    ),
                    _buildDrawerItem(
                      context,
                      "Experience",
                      ScrollControllerProvider.experienceKey,
                    ),
                    _buildDrawerItem(
                      context,
                      "Projects",
                      ScrollControllerProvider.projectKey,
                    ),
                    _buildDrawerItem(
                      context,
                      "Contact",
                      ScrollControllerProvider.contactKey,
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: Stack(
        children: [
          // Latar Belakang Gradasi Premium
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff0F172A),
                    Color(0xff0B1E36),
                    Color(0xff1E1B4B),
                    Color(0xff2E1065),
                    Color(0xff1E293B),
                    Color(0xff0F172A),
                  ],
                  stops: [0.0, 0.15, 0.35, 0.60, 0.82, 1.0],
                ),
              ),
            ),
          ),

          // Partikel & Emote Melayang
          const Positioned.fill(child: BackgroundBlobs()),

          // Konten Utama Portfolio
          SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  // 3. PASANG _scrollController di sini! Ini kunci agar bug navbar sembuh
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 85,
                      ), // Ruang agar tidak tertutup Navbar
                      // Hero Section biasanya paling atas, tidak perlu key (atau bisa diberi jika diinginkan)
                      const HeroSection(),

                      // 4. PASANG GlobalKey dari Provider ke masing-masing widget Section
                      AboutSection(key: ScrollControllerProvider.aboutKey),

                      ExperienceSection(
                        key: ScrollControllerProvider.experienceKey,
                      ),

                      ProjectSection(key: ScrollControllerProvider.projectKey),

                      ContactSection(key: ScrollControllerProvider.contactKey),
                    ],
                  ),
                ),

                // Sticky Navbar (Selalu Melayang di Atas)
                const Positioned(top: 0, left: 0, right: 0, child: Navbar()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Fungsi pembantu untuk item Drawer di dalam _HomePageState
Widget _buildDrawerItem(BuildContext context, String title, GlobalKey key) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(fontSize: 18, color: Colors.white),
    ),
    onTap: () {
      Navigator.pop(context); // Tutup drawer terlebih dahulu
      ScrollControllerProvider.scrollToSection(key); // Gulir ke section
    },
  );
}
