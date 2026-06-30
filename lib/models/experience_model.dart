import 'package:flutter/material.dart';

class ExperienceModel {
  final String year;
  final String title;
  final String description;
  final IconData icon;

  const ExperienceModel({
    required this.year,
    required this.title,
    required this.description,
    required this.icon,
  });
}
