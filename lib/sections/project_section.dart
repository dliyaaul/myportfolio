import 'package:flutter/material.dart';
import '../constants/data.dart';
import '../widgets/animated_section.dart';
import '../widgets/project_card.dart';
import '../widgets/section_title.dart';
import '../widgets/responsive_layout.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return AnimatedSection(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 100,
          vertical: isMobile ? 60 : 80,
        ),
        child: Column(
          children: [
            const SectionTitle(title: "Projects"),
            const SizedBox(height: 64),
            // Menyusun letak tumpukan card secara teratur & proporsional
            Wrap(
              spacing: 32,
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: PortfolioData.projects
                  .map((project) => ProjectCard(project: project))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
