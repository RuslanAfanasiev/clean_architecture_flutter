class CourseOverview {
  final String id;
  final String title;
  final String institute;
  final double rating;
  final String image;
  final int? progress;

  const CourseOverview({
    required this.id,
    required this.title,
    required this.institute,
    required this.rating,
    required this.image,
    this.progress,
  });
}

