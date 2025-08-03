// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelResponseImpl _$$ReviewModelResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ReviewModelResponseImpl(
  averageRating: (json['average_rating'] as num?)?.toDouble(),
  totalRatings: (json['total_ratings'] as num?)?.toInt(),
  totalReviews: (json['total_reviews'] as num?)?.toInt(),
  starCounts: (json['star_counts'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
  reviews: (json['reviews'] as List<dynamic>?)
      ?.map((e) => SingleReview.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ReviewModelResponseImplToJson(
  _$ReviewModelResponseImpl instance,
) => <String, dynamic>{
  'average_rating': instance.averageRating,
  'total_ratings': instance.totalRatings,
  'total_reviews': instance.totalReviews,
  'star_counts': instance.starCounts,
  'reviews': instance.reviews,
};

_$SingleReviewImpl _$$SingleReviewImplFromJson(Map<String, dynamic> json) =>
    _$SingleReviewImpl(
      user: json['user'] == null
          ? null
          : ReviewUser.fromJson(json['user'] as Map<String, dynamic>),
      rating: json['rating'] as String?,
      review: json['review'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$SingleReviewImplToJson(_$SingleReviewImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'rating': instance.rating,
      'review': instance.review,
      'date': instance.date,
    };

_$ReviewUserImpl _$$ReviewUserImplFromJson(Map<String, dynamic> json) =>
    _$ReviewUserImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$ReviewUserImplToJson(_$ReviewUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
