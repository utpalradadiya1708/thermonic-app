class ScheduleItem {
  final String title;
  final String subtitle;
  final String? subtitleIcon;
  final String image;

  ScheduleItem({
    required this.title,
    required this.subtitle,
    this.subtitleIcon,
    required this.image,
  });
}
