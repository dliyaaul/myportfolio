class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;

  final List<String> image;

  final String githubUrl;
  final String liveDemoUrl;

  final String year;
  final String category;

  final bool featured;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.image,
    required this.githubUrl,
    required this.liveDemoUrl,
    required this.year,
    required this.category,
    required this.featured,
  });
}
