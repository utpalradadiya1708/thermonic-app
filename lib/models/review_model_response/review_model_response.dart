import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model_response.freezed.dart';
part 'review_model_response.g.dart';

@freezed
class ReviewModelResponse with _$ReviewModelResponse {
  const factory ReviewModelResponse({
    @JsonKey(name: 'average_rating') double? averageRating,
    @JsonKey(name: 'total_ratings') int? totalRatings,
    @JsonKey(name: 'total_reviews') int? totalReviews,
    @JsonKey(name: 'star_counts') Map<String, int>? starCounts,
    List<SingleReview>? reviews,
  }) = _ReviewModelResponse;

  factory ReviewModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelResponseFromJson(json);
}

@freezed
class SingleReview with _$SingleReview {
  const factory SingleReview({
    ReviewUser? user,
    String? rating,
    String? review,
    String? date,
  }) = _SingleReview;

  factory SingleReview.fromJson(Map<String, dynamic> json) =>
      _$SingleReviewFromJson(json);
}

@freezed
class ReviewUser with _$ReviewUser {
  const factory ReviewUser({int? id, String? name, String? image}) =
      _ReviewUser;

  factory ReviewUser.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserFromJson(json);
}
