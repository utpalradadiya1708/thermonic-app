import 'package:thermonic/models/topic_model.dart';

class ChapterModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final bool isFree;
  final bool isLocked;
  bool isSavedToWishlist;
  final double? rating;
  final int? totalReviews;
  final List<TopicModel> topics;
  final String? duration;

  ChapterModel({
    required this.id,
    required this.title,
    this.description = '',
    this.imageUrl = '',
    required this.price,
    this.isFree = false,
    this.isLocked = true,
    this.isSavedToWishlist = false,
    this.topics = const [],
    this.duration,
    this.rating,
    this.totalReviews,
  });
}
