import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSection extends StatefulWidget {
  final Widget child;

  const AnimatedSection({super.key, required this.child});

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.child.hashCode),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !visible) {
          setState(() {
            visible = true;
          });
        }
      },
      child: visible
          ? widget.child
                .animate()
                .fadeIn(duration: 700.ms, curve: Curves.easeOut)
                .slideY(
                  begin: 0.08,
                  end: 0,
                  duration: 700.ms,
                  curve: Curves.easeOutCubic,
                )
          : Opacity(opacity: 0, child: widget.child),
    );
  }
}
