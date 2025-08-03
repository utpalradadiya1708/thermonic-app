// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReviewModelResponse _$ReviewModelResponseFromJson(Map<String, dynamic> json) {
  return _ReviewModelResponse.fromJson(json);
}

/// @nodoc
mixin _$ReviewModelResponse {
  @JsonKey(name: 'average_rating')
  double? get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_ratings')
  int? get totalRatings => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_reviews')
  int? get totalReviews => throw _privateConstructorUsedError;
  @JsonKey(name: 'star_counts')
  Map<String, int>? get starCounts => throw _privateConstructorUsedError;
  List<SingleReview>? get reviews => throw _privateConstructorUsedError;

  /// Serializes this ReviewModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewModelResponseCopyWith<ReviewModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelResponseCopyWith<$Res> {
  factory $ReviewModelResponseCopyWith(
    ReviewModelResponse value,
    $Res Function(ReviewModelResponse) then,
  ) = _$ReviewModelResponseCopyWithImpl<$Res, ReviewModelResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'average_rating') double? averageRating,
    @JsonKey(name: 'total_ratings') int? totalRatings,
    @JsonKey(name: 'total_reviews') int? totalReviews,
    @JsonKey(name: 'star_counts') Map<String, int>? starCounts,
    List<SingleReview>? reviews,
  });
}

/// @nodoc
class _$ReviewModelResponseCopyWithImpl<$Res, $Val extends ReviewModelResponse>
    implements $ReviewModelResponseCopyWith<$Res> {
  _$ReviewModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = freezed,
    Object? totalRatings = freezed,
    Object? totalReviews = freezed,
    Object? starCounts = freezed,
    Object? reviews = freezed,
  }) {
    return _then(
      _value.copyWith(
            averageRating: freezed == averageRating
                ? _value.averageRating
                : averageRating // ignore: cast_nullable_to_non_nullable
                      as double?,
            totalRatings: freezed == totalRatings
                ? _value.totalRatings
                : totalRatings // ignore: cast_nullable_to_non_nullable
                      as int?,
            totalReviews: freezed == totalReviews
                ? _value.totalReviews
                : totalReviews // ignore: cast_nullable_to_non_nullable
                      as int?,
            starCounts: freezed == starCounts
                ? _value.starCounts
                : starCounts // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>?,
            reviews: freezed == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as List<SingleReview>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewModelResponseImplCopyWith<$Res>
    implements $ReviewModelResponseCopyWith<$Res> {
  factory _$$ReviewModelResponseImplCopyWith(
    _$ReviewModelResponseImpl value,
    $Res Function(_$ReviewModelResponseImpl) then,
  ) = __$$ReviewModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'average_rating') double? averageRating,
    @JsonKey(name: 'total_ratings') int? totalRatings,
    @JsonKey(name: 'total_reviews') int? totalReviews,
    @JsonKey(name: 'star_counts') Map<String, int>? starCounts,
    List<SingleReview>? reviews,
  });
}

/// @nodoc
class __$$ReviewModelResponseImplCopyWithImpl<$Res>
    extends _$ReviewModelResponseCopyWithImpl<$Res, _$ReviewModelResponseImpl>
    implements _$$ReviewModelResponseImplCopyWith<$Res> {
  __$$ReviewModelResponseImplCopyWithImpl(
    _$ReviewModelResponseImpl _value,
    $Res Function(_$ReviewModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? averageRating = freezed,
    Object? totalRatings = freezed,
    Object? totalReviews = freezed,
    Object? starCounts = freezed,
    Object? reviews = freezed,
  }) {
    return _then(
      _$ReviewModelResponseImpl(
        averageRating: freezed == averageRating
            ? _value.averageRating
            : averageRating // ignore: cast_nullable_to_non_nullable
                  as double?,
        totalRatings: freezed == totalRatings
            ? _value.totalRatings
            : totalRatings // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalReviews: freezed == totalReviews
            ? _value.totalReviews
            : totalReviews // ignore: cast_nullable_to_non_nullable
                  as int?,
        starCounts: freezed == starCounts
            ? _value._starCounts
            : starCounts // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>?,
        reviews: freezed == reviews
            ? _value._reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as List<SingleReview>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewModelResponseImpl implements _ReviewModelResponse {
  const _$ReviewModelResponseImpl({
    @JsonKey(name: 'average_rating') this.averageRating,
    @JsonKey(name: 'total_ratings') this.totalRatings,
    @JsonKey(name: 'total_reviews') this.totalReviews,
    @JsonKey(name: 'star_counts') final Map<String, int>? starCounts,
    final List<SingleReview>? reviews,
  }) : _starCounts = starCounts,
       _reviews = reviews;

  factory _$ReviewModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelResponseImplFromJson(json);

  @override
  @JsonKey(name: 'average_rating')
  final double? averageRating;
  @override
  @JsonKey(name: 'total_ratings')
  final int? totalRatings;
  @override
  @JsonKey(name: 'total_reviews')
  final int? totalReviews;
  final Map<String, int>? _starCounts;
  @override
  @JsonKey(name: 'star_counts')
  Map<String, int>? get starCounts {
    final value = _starCounts;
    if (value == null) return null;
    if (_starCounts is EqualUnmodifiableMapView) return _starCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<SingleReview>? _reviews;
  @override
  List<SingleReview>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReviewModelResponse(averageRating: $averageRating, totalRatings: $totalRatings, totalReviews: $totalReviews, starCounts: $starCounts, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelResponseImpl &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalRatings, totalRatings) ||
                other.totalRatings == totalRatings) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            const DeepCollectionEquality().equals(
              other._starCounts,
              _starCounts,
            ) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    averageRating,
    totalRatings,
    totalReviews,
    const DeepCollectionEquality().hash(_starCounts),
    const DeepCollectionEquality().hash(_reviews),
  );

  /// Create a copy of ReviewModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelResponseImplCopyWith<_$ReviewModelResponseImpl> get copyWith =>
      __$$ReviewModelResponseImplCopyWithImpl<_$ReviewModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelResponseImplToJson(this);
  }
}

abstract class _ReviewModelResponse implements ReviewModelResponse {
  const factory _ReviewModelResponse({
    @JsonKey(name: 'average_rating') final double? averageRating,
    @JsonKey(name: 'total_ratings') final int? totalRatings,
    @JsonKey(name: 'total_reviews') final int? totalReviews,
    @JsonKey(name: 'star_counts') final Map<String, int>? starCounts,
    final List<SingleReview>? reviews,
  }) = _$ReviewModelResponseImpl;

  factory _ReviewModelResponse.fromJson(Map<String, dynamic> json) =
      _$ReviewModelResponseImpl.fromJson;

  @override
  @JsonKey(name: 'average_rating')
  double? get averageRating;
  @override
  @JsonKey(name: 'total_ratings')
  int? get totalRatings;
  @override
  @JsonKey(name: 'total_reviews')
  int? get totalReviews;
  @override
  @JsonKey(name: 'star_counts')
  Map<String, int>? get starCounts;
  @override
  List<SingleReview>? get reviews;

  /// Create a copy of ReviewModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewModelResponseImplCopyWith<_$ReviewModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SingleReview _$SingleReviewFromJson(Map<String, dynamic> json) {
  return _SingleReview.fromJson(json);
}

/// @nodoc
mixin _$SingleReview {
  ReviewUser? get user => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this SingleReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SingleReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleReviewCopyWith<SingleReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleReviewCopyWith<$Res> {
  factory $SingleReviewCopyWith(
    SingleReview value,
    $Res Function(SingleReview) then,
  ) = _$SingleReviewCopyWithImpl<$Res, SingleReview>;
  @useResult
  $Res call({ReviewUser? user, String? rating, String? review, String? date});

  $ReviewUserCopyWith<$Res>? get user;
}

/// @nodoc
class _$SingleReviewCopyWithImpl<$Res, $Val extends SingleReview>
    implements $SingleReviewCopyWith<$Res> {
  _$SingleReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? date = freezed,
  }) {
    return _then(
      _value.copyWith(
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as ReviewUser?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as String?,
            review: freezed == review
                ? _value.review
                : review // ignore: cast_nullable_to_non_nullable
                      as String?,
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of SingleReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewUserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ReviewUserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SingleReviewImplCopyWith<$Res>
    implements $SingleReviewCopyWith<$Res> {
  factory _$$SingleReviewImplCopyWith(
    _$SingleReviewImpl value,
    $Res Function(_$SingleReviewImpl) then,
  ) = __$$SingleReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReviewUser? user, String? rating, String? review, String? date});

  @override
  $ReviewUserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$SingleReviewImplCopyWithImpl<$Res>
    extends _$SingleReviewCopyWithImpl<$Res, _$SingleReviewImpl>
    implements _$$SingleReviewImplCopyWith<$Res> {
  __$$SingleReviewImplCopyWithImpl(
    _$SingleReviewImpl _value,
    $Res Function(_$SingleReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SingleReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? date = freezed,
  }) {
    return _then(
      _$SingleReviewImpl(
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as ReviewUser?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as String?,
        review: freezed == review
            ? _value.review
            : review // ignore: cast_nullable_to_non_nullable
                  as String?,
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleReviewImpl implements _SingleReview {
  const _$SingleReviewImpl({this.user, this.rating, this.review, this.date});

  factory _$SingleReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleReviewImplFromJson(json);

  @override
  final ReviewUser? user;
  @override
  final String? rating;
  @override
  final String? review;
  @override
  final String? date;

  @override
  String toString() {
    return 'SingleReview(user: $user, rating: $rating, review: $review, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleReviewImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, rating, review, date);

  /// Create a copy of SingleReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleReviewImplCopyWith<_$SingleReviewImpl> get copyWith =>
      __$$SingleReviewImplCopyWithImpl<_$SingleReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleReviewImplToJson(this);
  }
}

abstract class _SingleReview implements SingleReview {
  const factory _SingleReview({
    final ReviewUser? user,
    final String? rating,
    final String? review,
    final String? date,
  }) = _$SingleReviewImpl;

  factory _SingleReview.fromJson(Map<String, dynamic> json) =
      _$SingleReviewImpl.fromJson;

  @override
  ReviewUser? get user;
  @override
  String? get rating;
  @override
  String? get review;
  @override
  String? get date;

  /// Create a copy of SingleReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleReviewImplCopyWith<_$SingleReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewUser _$ReviewUserFromJson(Map<String, dynamic> json) {
  return _ReviewUser.fromJson(json);
}

/// @nodoc
mixin _$ReviewUser {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this ReviewUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewUserCopyWith<ReviewUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewUserCopyWith<$Res> {
  factory $ReviewUserCopyWith(
    ReviewUser value,
    $Res Function(ReviewUser) then,
  ) = _$ReviewUserCopyWithImpl<$Res, ReviewUser>;
  @useResult
  $Res call({int? id, String? name, String? image});
}

/// @nodoc
class _$ReviewUserCopyWithImpl<$Res, $Val extends ReviewUser>
    implements $ReviewUserCopyWith<$Res> {
  _$ReviewUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewUserImplCopyWith<$Res>
    implements $ReviewUserCopyWith<$Res> {
  factory _$$ReviewUserImplCopyWith(
    _$ReviewUserImpl value,
    $Res Function(_$ReviewUserImpl) then,
  ) = __$$ReviewUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? image});
}

/// @nodoc
class __$$ReviewUserImplCopyWithImpl<$Res>
    extends _$ReviewUserCopyWithImpl<$Res, _$ReviewUserImpl>
    implements _$$ReviewUserImplCopyWith<$Res> {
  __$$ReviewUserImplCopyWithImpl(
    _$ReviewUserImpl _value,
    $Res Function(_$ReviewUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _$ReviewUserImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewUserImpl implements _ReviewUser {
  const _$ReviewUserImpl({this.id, this.name, this.image});

  factory _$ReviewUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewUserImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? image;

  @override
  String toString() {
    return 'ReviewUser(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewUserImplCopyWith<_$ReviewUserImpl> get copyWith =>
      __$$ReviewUserImplCopyWithImpl<_$ReviewUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewUserImplToJson(this);
  }
}

abstract class _ReviewUser implements ReviewUser {
  const factory _ReviewUser({
    final int? id,
    final String? name,
    final String? image,
  }) = _$ReviewUserImpl;

  factory _ReviewUser.fromJson(Map<String, dynamic> json) =
      _$ReviewUserImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get image;

  /// Create a copy of ReviewUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewUserImplCopyWith<_$ReviewUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
