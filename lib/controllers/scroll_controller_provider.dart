import 'package:flutter/material.dart';

class ScrollControllerProvider {
  static final scrollController = ScrollController();

  static final heroKey = GlobalKey();
  static final aboutKey = GlobalKey();
  static final experienceKey = GlobalKey();
  static final projectKey = GlobalKey();
  static final contactKey = GlobalKey();

  static set controller(ScrollController controller) {}

  static void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}
