import 'package:flutter/material.dart';
import '../constants/data.dart';
import '../widgets/animated_section.dart';
import '../widgets/section_title.dart';
import '../widgets/timeline_item.dart';
import '../widgets/responsive_layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return AnimatedSection(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 120,
          vertical: isMobile ? 60 : 80,
        ),
        child: Column(
          children: [
            const SectionTitle(title: "Experience"),
            const SizedBox(height: 64),
            // Mengatur batas lebar maksimal agar timeline rapi di layar ultra-wide
            Container(
              constraints: BoxConstraints(maxWidth: 900),
              child: Column(
                children: PortfolioData.experiences
                    .map(
                      (e) => TimelineItem(
                        year: e.year,
                        title: e.title,
                        description: e.description,
                        icon: e.icon,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
