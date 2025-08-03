class TopicModel {
  final String id;
  final String title;
  final String videoUrl;
  final String duration;
  final bool isLocked;
  final String? thumbnail;

  TopicModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.duration,
    this.isLocked = true,
    this.thumbnail,
  });
}
