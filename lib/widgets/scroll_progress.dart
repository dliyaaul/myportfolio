import 'package:flutter/material.dart';

class ScrollProgress extends StatefulWidget {
  final ScrollController controller;

  const ScrollProgress({super.key, required this.controller});

  @override
  State<ScrollProgress> createState() => _ScrollProgressState();
}

class _ScrollProgressState extends State<ScrollProgress> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateProgress);
  }

  void _updateProgress() {
    if (!widget.controller.hasClients) return;
    final max = widget.controller.position.maxScrollExtent;
    final current = widget.controller.offset;

    setState(() {
      // Menghindari pembagian dengan angka 0 jika konten terlalu pendek
      progress = max > 0 ? (current / max).clamp(0.0, 1.0) : 0.0;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateProgress);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: 4,
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 50,
            ), // Membuat pergerakan indikator terasa mengalir
            width: constraints.maxWidth * progress,
            height: 4,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff38BDF8),
                  Color(0xff818CF8),
                  Color(0xffC084FC),
                ], // Cyan -> Indigo -> Purple
              ),
            ),
          ),
        );
      },
    );
  }
}
