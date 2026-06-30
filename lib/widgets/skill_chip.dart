import 'package:flutter/material.dart';

class SkillChip extends StatefulWidget {
  final String text;

  const SkillChip({super.key, required this.text});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isHovered
              ? const Color(0xff0EA5E9).withValues(
                  alpha: 0.2,
                ) // Lebih terang saat di-hover
              : const Color(0xff38BDF8).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isHovered
                ? const Color(0xff0EA5E9)
                : const Color(0xff38BDF8).withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: isHovered
                ? const Color(0xff38BDF8)
                : const Color(0xff7DD3FC),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
