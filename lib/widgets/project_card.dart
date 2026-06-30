import 'package:flutter/material.dart';
import '../models/project_model.dart';
import 'skill_chip.dart';
import 'project_dialog.dart';
import 'dart:async';

class ProjectCard extends StatefulWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  final PageController _pageController = PageController();

  bool isHover = false;

  int _currentPage = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_pageController.hasClients) return;

      if (widget.project.image.isEmpty) return;

      _currentPage++;

      if (_currentPage >= widget.project.image.length) {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => ProjectDialog(project: widget.project),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()
            ..translate(0, isHover ? -8 : 0), // Card naik sedikit saat hover
          width: 380,
          decoration: BoxDecoration(
            color: const Color(0xff1E293B).withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isHover
                  ? const Color(0xff38BDF8).withValues(alpha: 0.5)
                  : const Color(0xff334155).withValues(alpha: 0.5),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: isHover ? 40 : 20,
                spreadRadius: isHover ? 0 : -5,
                color: isHover
                    ? const Color(0xff38BDF8).withValues(alpha: 0.15)
                    : Colors.black.withValues(alpha: 0.3),
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Gambar Utama
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(23),
                ),
                child: Stack(
                  children: [
                    // Efek Zoom pada gambar saat di-hover
                    AnimatedScale(
                      scale: isHover ? 1.06 : 1.0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      child: SizedBox(
                        height: 220,
                        width: double.infinity,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.project.image.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Image.asset(
                              widget.project.image[index],
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) {
                                return Container(
                                  color: const Color(0xff334155),
                                  child: const Center(
                                    child: Icon(
                                      Icons.broken_image_rounded,
                                      color: Color(0xff64748B),
                                      size: 40,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    // Gradient overlay di atas gambar agar terlihat dramatis
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.4),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 12,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.project.image.length, (
                          index,
                        ) {
                          final active = index == _currentPage;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: active ? 22 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: active ? Colors.white : Colors.white38,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }),
                      ),
                    ),

                    if (widget.project.featured)
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffF59E0B),
                                Color(0xffD97706),
                              ], // Gold Gradient
                            ),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xffD97706,
                                ).withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Text(
                            "🔑 Featured",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Bagian Konten Teks
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.project.description,
                      style: const TextStyle(
                        color: Color(0xff94A3B8),
                        height: 1.5,
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.technologies
                          .map((e) => SkillChip(text: e))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
