import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/animated_section.dart';
import '../widgets/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSection(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            const SectionTitle(title: "Contact"),
            const SizedBox(height: 50),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                _ContactCard(
                  icon: const FaIcon(FontAwesomeIcons.github),
                  title: "GitHub",
                  color: Colors.white,
                  url: "https://github.com/dliyaaul",
                ),
                _ContactCard(
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                  title: "LinkedIn",
                  color: const Color(0xff0A66C2),
                  url: "https://www.linkedin.com/in/muhammaddliyaaul/",
                ),
                _ContactCard(
                  icon: const FaIcon(FontAwesomeIcons.envelope),
                  title: "Email",
                  color: const Color(0xffEA4335),
                  url: "mailto:bakun8580@gmail.com",
                ),
                _ContactCard(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp),
                  title: "WhatsApp",
                  color: const Color(0xff25D366),
                  url: "https://wa.me/6282143663964",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Stateful Widget internal khusus untuk menangani interaksi hover per kartu
class _ContactCard extends StatefulWidget {
  final Widget icon;
  final String title;
  final Color color;
  final String url;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.color,
    required this.url,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool isHovered = false;

  Future<void> _openLink() async {
    final uri = Uri.parse(widget.url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _openLink,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 180,
          height: 140,
          decoration: BoxDecoration(
            color: isHovered
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.white.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered
                  ? widget.color.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.08),
              width: 1.5,
            ),
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.15),
                  blurRadius: 25,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon berubah warna sesuai brand saat di-hover
              IconTheme(
                data: IconThemeData(
                  color: isHovered ? widget.color : const Color(0xff94A3B8),
                  size: 32,
                ),
                child: widget.icon,
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: TextStyle(
                  color: isHovered ? Colors.white : const Color(0xff94A3B8),
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
