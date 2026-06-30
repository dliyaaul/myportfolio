import '../models/project_model.dart';
import '../models/experience_model.dart';
import 'package:flutter/material.dart';

class PortfolioData {
  static const skills = [
    "Flutter",
    "Dart",
    "Laravel",
    "PHP",
    "React",
    "MySQL",
    "Java",
    "Git",
    "Github",
    "Figma",
    "REST API",
    "Google Maps",
    "Firebase",
    "GeoLocator",
  ];

  static const projects = [
    ProjectModel(
      title: "Fleet Management Dashboard",

      description:
          "Dashboard monitoring kendaraan realtime menggunakan Google Maps dan React.",

      technologies: ["React", "MUI", "Axios", "Google Maps"],

      image: [
        "assets/project/fleet/fleet1.png",
        "assets/project/fleet/fleet2.png",
        "assets/project/fleet/fleet3.png",
      ],

      githubUrl: "",

      liveDemoUrl: "https://geagps.com/",

      year: "2025",

      category: "Web App",

      featured: true,
    ),

    ProjectModel(
      title: "Pomodoro App",

      description:
          "Aplikasi produktivitas berbasis Flutter dengan alarm custom dan statistik.",

      technologies: ["Flutter", "Firebase", "Provider"],

      image: [
        "assets/project/pomodoro/pomodoro1.jpeg",
        "assets/project/pomodoro/pomodoro2.jpeg",
        "assets/project/pomodoro/pomodoro3.jpeg",
      ],

      githubUrl: "https://github.com/dliyaaul/pomodoro",

      liveDemoUrl: "",

      year: "2026",

      category: "Mobile App",

      featured: true,
    ),

    ProjectModel(
      title: "Location-Based Attendance System",

      description:
          "A Flutter-based attendance application that allows users to check in and check out only within a predefined location radius using GPS and Google Maps integration.",

      technologies: [
        "Flutter",
        "Dart",
        "MySQL",
        "Google Maps",
        "REST API",
        "GeoLocator",
        "PHP",
      ],

      image: [
        "assets/project/absensi/absensi1.jpeg",
        "assets/project/absensi/absensi2.jpeg",
        "assets/project/absensi/absensi3.jpeg",
        "assets/project/absensi/absensi4.jpeg",
      ],

      githubUrl: "https://github.com/AweDNur/Tubes-Mobile",

      liveDemoUrl: "",

      year: "2025",

      category: "Mobile App",

      featured: true,
    ),
  ];

  static const experiences = [
    ExperienceModel(
      year: "2026",
      title: "Flutter Mobile & Web Developer",
      description:
          "Developed responsive mobile applications and modern web portfolios using Flutter, emphasizing clean architecture, responsive design, reusable components, and interactive user experiences.",
      icon: Icons.flutter_dash_rounded,
    ),

    ExperienceModel(
      year: "2025",
      title: "Laravel Full-Stack Developer",
      description:
          "Built web-based information systems using Laravel and MySQL with authentication, CRUD operations, reporting features, and REST API integration.",
      icon: Icons.web_rounded,
    ),

    ExperienceModel(
      year: "2025",
      title: "Fleet Management Dashboard",
      description:
          "Developed a real-time fleet management dashboard using React, Axios, REST API, and Google Maps to monitor vehicles and operational data.",
      icon: Icons.map_rounded,
    ),

    ExperienceModel(
      year: "2024",
      title: "UI/UX & Software Development",
      description:
          "Designed modern user interfaces with Figma while developing various academic and personal software projects to strengthen frontend and backend development skills.",
      icon: Icons.design_services_rounded,
    ),

    ExperienceModel(
      year: "2023",
      title: "Laravel Web Development",
      description:
          "Started developing dynamic web applications using Laravel, PHP, MySQL, and the MVC architecture while learning best practices in web development.",
      icon: Icons.code_rounded,
    ),

    ExperienceModel(
      year: "2022",
      title: "Programming Fundamentals",
      description:
          "Began the software development journey by learning Java and PHP, focusing on object-oriented programming, algorithms, data structures, and problem-solving.",
      icon: Icons.school_rounded,
    ),
  ];
}
