import 'package:flutter/material.dart';
import '../models/project_model.dart';
import 'skill_chip.dart'; // Di-import untuk merombak tampilan tag teknologi

class ProjectDialog extends StatelessWidget {
  final ProjectModel project;

  const ProjectDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(
        0xff0F172A,
      ), // Menyelaraskan dengan background HomePage
      elevation: 24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(
          color: Color(0xff334155),
          width: 1,
        ), // Border tipis luar
      ),
      child: Container(
        width: 750,
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Gambar Project dengan shadow melayang
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 420,
                  child: PageView.builder(
                    itemCount: project.image.length,
                    itemBuilder: (_, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          project.image[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Judul Utama
              Text(
                project.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),

              // Deskripsi
              Text(
                project.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff94A3B8),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),

              // Deretan Chip Teknologi (Menggunakan SkillChip buatanmu!)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: project.technologies
                    .map((tech) => SkillChip(text: tech))
                    .toList(),
              ),
              const SizedBox(height: 36),

              // Tombol Aksi Premium
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (project.githubUrl.isNotEmpty)
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xff38BDF8),
                        side: const BorderSide(color: Color(0xff38BDF8)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 18,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // buka github
                      },
                      icon: const Icon(Icons.code, size: 20),
                      label: const Text(
                        "GitHub",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                  if (project.githubUrl.isNotEmpty &&
                      project.liveDemoUrl.isNotEmpty)
                    const SizedBox(width: 16),

                  if (project.liveDemoUrl.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff38BDF8), Color(0xff3B82F6)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // buka live demo
                        },
                        icon: const Icon(Icons.launch, size: 20),
                        label: const Text(
                          "Live Demo",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
