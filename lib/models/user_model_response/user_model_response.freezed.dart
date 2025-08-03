// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModelResponse _$UserModelResponseFromJson(Map<String, dynamic> json) {
  return _UserModelResponse.fromJson(json);
}

/// @nodoc
mixin _$UserModelResponse {
  UserData get user => throw _privateConstructorUsedError;
  List<GradeModel>? get grades => throw _privateConstructorUsedError;

  /// Serializes this UserModelResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelResponseCopyWith<UserModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelResponseCopyWith<$Res> {
  factory $UserModelResponseCopyWith(
    UserModelResponse value,
    $Res Function(UserModelResponse) then,
  ) = _$UserModelResponseCopyWithImpl<$Res, UserModelResponse>;
  @useResult
  $Res call({UserData user, List<GradeModel>? grades});

  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class _$UserModelResponseCopyWithImpl<$Res, $Val extends UserModelResponse>
    implements $UserModelResponseCopyWith<$Res> {
  _$UserModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? grades = freezed}) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserData,
            grades: freezed == grades
                ? _value.grades
                : grades // ignore: cast_nullable_to_non_nullable
                      as List<GradeModel>?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get user {
    return $UserDataCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelResponseImplCopyWith<$Res>
    implements $UserModelResponseCopyWith<$Res> {
  factory _$$UserModelResponseImplCopyWith(
    _$UserModelResponseImpl value,
    $Res Function(_$UserModelResponseImpl) then,
  ) = __$$UserModelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserData user, List<GradeModel>? grades});

  @override
  $UserDataCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserModelResponseImplCopyWithImpl<$Res>
    extends _$UserModelResponseCopyWithImpl<$Res, _$UserModelResponseImpl>
    implements _$$UserModelResponseImplCopyWith<$Res> {
  __$$UserModelResponseImplCopyWithImpl(
    _$UserModelResponseImpl _value,
    $Res Function(_$UserModelResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? grades = freezed}) {
    return _then(
      _$UserModelResponseImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserData,
        grades: freezed == grades
            ? _value._grades
            : grades // ignore: cast_nullable_to_non_nullable
                  as List<GradeModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelResponseImpl implements _UserModelResponse {
  const _$UserModelResponseImpl({
    required this.user,
    final List<GradeModel>? grades,
  }) : _grades = grades;

  factory _$UserModelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelResponseImplFromJson(json);

  @override
  final UserData user;
  final List<GradeModel>? _grades;
  @override
  List<GradeModel>? get grades {
    final value = _grades;
    if (value == null) return null;
    if (_grades is EqualUnmodifiableListView) return _grades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserModelResponse(user: $user, grades: $grades)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._grades, _grades));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    const DeepCollectionEquality().hash(_grades),
  );

  /// Create a copy of UserModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelResponseImplCopyWith<_$UserModelResponseImpl> get copyWith =>
      __$$UserModelResponseImplCopyWithImpl<_$UserModelResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelResponseImplToJson(this);
  }
}

abstract class _UserModelResponse implements UserModelResponse {
  const factory _UserModelResponse({
    required final UserData user,
    final List<GradeModel>? grades,
  }) = _$UserModelResponseImpl;

  factory _UserModelResponse.fromJson(Map<String, dynamic> json) =
      _$UserModelResponseImpl.fromJson;

  @override
  UserData get user;
  @override
  List<GradeModel>? get grades;

  /// Create a copy of UserModelResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelResponseImplCopyWith<_$UserModelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_formatted")
  String? get phoneFormatted => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "grade_id")
  int? get gradeId => throw _privateConstructorUsedError;
  @JsonKey(name: "stream_id")
  int? get streamId => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_picture_full_url")
  String? get profilePictureFullUrl => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  bool? get isProfileSetup => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call({
    int? id,
    String? name,
    String? phone,
    @JsonKey(name: "phone_formatted") String? phoneFormatted,
    String? email,
    @JsonKey(name: "grade_id") int? gradeId,
    @JsonKey(name: "stream_id") int? streamId,
    @JsonKey(name: "profile_picture_full_url") String? profilePictureFullUrl,
    String? language,
    bool? isProfileSetup,
    String? token,
  });
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? phoneFormatted = freezed,
    Object? email = freezed,
    Object? gradeId = freezed,
    Object? streamId = freezed,
    Object? profilePictureFullUrl = freezed,
    Object? language = freezed,
    Object? isProfileSetup = freezed,
    Object? token = freezed,
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
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneFormatted: freezed == phoneFormatted
                ? _value.phoneFormatted
                : phoneFormatted // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            gradeId: freezed == gradeId
                ? _value.gradeId
                : gradeId // ignore: cast_nullable_to_non_nullable
                      as int?,
            streamId: freezed == streamId
                ? _value.streamId
                : streamId // ignore: cast_nullable_to_non_nullable
                      as int?,
            profilePictureFullUrl: freezed == profilePictureFullUrl
                ? _value.profilePictureFullUrl
                : profilePictureFullUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            language: freezed == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String?,
            isProfileSetup: freezed == isProfileSetup
                ? _value.isProfileSetup
                : isProfileSetup // ignore: cast_nullable_to_non_nullable
                      as bool?,
            token: freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
    _$UserDataImpl value,
    $Res Function(_$UserDataImpl) then,
  ) = __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    String? name,
    String? phone,
    @JsonKey(name: "phone_formatted") String? phoneFormatted,
    String? email,
    @JsonKey(name: "grade_id") int? gradeId,
    @JsonKey(name: "stream_id") int? streamId,
    @JsonKey(name: "profile_picture_full_url") String? profilePictureFullUrl,
    String? language,
    bool? isProfileSetup,
    String? token,
  });
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
    _$UserDataImpl _value,
    $Res Function(_$UserDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? phoneFormatted = freezed,
    Object? email = freezed,
    Object? gradeId = freezed,
    Object? streamId = freezed,
    Object? profilePictureFullUrl = freezed,
    Object? language = freezed,
    Object? isProfileSetup = freezed,
    Object? token = freezed,
  }) {
    return _then(
      _$UserDataImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneFormatted: freezed == phoneFormatted
            ? _value.phoneFormatted
            : phoneFormatted // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        gradeId: freezed == gradeId
            ? _value.gradeId
            : gradeId // ignore: cast_nullable_to_non_nullable
                  as int?,
        streamId: freezed == streamId
            ? _value.streamId
            : streamId // ignore: cast_nullable_to_non_nullable
                  as int?,
        profilePictureFullUrl: freezed == profilePictureFullUrl
            ? _value.profilePictureFullUrl
            : profilePictureFullUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        language: freezed == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String?,
        isProfileSetup: freezed == isProfileSetup
            ? _value.isProfileSetup
            : isProfileSetup // ignore: cast_nullable_to_non_nullable
                  as bool?,
        token: freezed == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl({
    this.id,
    this.name,
    this.phone,
    @JsonKey(name: "phone_formatted") this.phoneFormatted,
    this.email,
    @JsonKey(name: "grade_id") this.gradeId,
    @JsonKey(name: "stream_id") this.streamId,
    @JsonKey(name: "profile_picture_full_url") this.profilePictureFullUrl,
    this.language,
    this.isProfileSetup,
    this.token,
  });

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  @JsonKey(name: "phone_formatted")
  final String? phoneFormatted;
  @override
  final String? email;
  @override
  @JsonKey(name: "grade_id")
  final int? gradeId;
  @override
  @JsonKey(name: "stream_id")
  final int? streamId;
  @override
  @JsonKey(name: "profile_picture_full_url")
  final String? profilePictureFullUrl;
  @override
  final String? language;
  @override
  final bool? isProfileSetup;
  @override
  final String? token;

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, phone: $phone, phoneFormatted: $phoneFormatted, email: $email, gradeId: $gradeId, streamId: $streamId, profilePictureFullUrl: $profilePictureFullUrl, language: $language, isProfileSetup: $isProfileSetup, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.phoneFormatted, phoneFormatted) ||
                other.phoneFormatted == phoneFormatted) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gradeId, gradeId) || other.gradeId == gradeId) &&
            (identical(other.streamId, streamId) ||
                other.streamId == streamId) &&
            (identical(other.profilePictureFullUrl, profilePictureFullUrl) ||
                other.profilePictureFullUrl == profilePictureFullUrl) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.isProfileSetup, isProfileSetup) ||
                other.isProfileSetup == isProfileSetup) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    phone,
    phoneFormatted,
    email,
    gradeId,
    streamId,
    profilePictureFullUrl,
    language,
    isProfileSetup,
    token,
  );

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(this);
  }
}

abstract class _UserData implements UserData {
  const factory _UserData({
    final int? id,
    final String? name,
    final String? phone,
    @JsonKey(name: "phone_formatted") final String? phoneFormatted,
    final String? email,
    @JsonKey(name: "grade_id") final int? gradeId,
    @JsonKey(name: "stream_id") final int? streamId,
    @JsonKey(name: "profile_picture_full_url")
    final String? profilePictureFullUrl,
    final String? language,
    final bool? isProfileSetup,
    final String? token,
  }) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get phone;
  @override
  @JsonKey(name: "phone_formatted")
  String? get phoneFormatted;
  @override
  String? get email;
  @override
  @JsonKey(name: "grade_id")
  int? get gradeId;
  @override
  @JsonKey(name: "stream_id")
  int? get streamId;
  @override
  @JsonKey(name: "profile_picture_full_url")
  String? get profilePictureFullUrl;
  @override
  String? get language;
  @override
  bool? get isProfileSetup;
  @override
  String? get token;

  /// Create a copy of UserData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GradeModel _$GradeModelFromJson(Map<String, dynamic> json) {
  return _GradeModel.fromJson(json);
}

/// @nodoc
mixin _$GradeModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<StreamModel>? get streams => throw _privateConstructorUsedError;

  /// Serializes this GradeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GradeModelCopyWith<GradeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeModelCopyWith<$Res> {
  factory $GradeModelCopyWith(
    GradeModel value,
    $Res Function(GradeModel) then,
  ) = _$GradeModelCopyWithImpl<$Res, GradeModel>;
  @useResult
  $Res call({int? id, String? name, List<StreamModel>? streams});
}

/// @nodoc
class _$GradeModelCopyWithImpl<$Res, $Val extends GradeModel>
    implements $GradeModelCopyWith<$Res> {
  _$GradeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? streams = freezed,
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
            streams: freezed == streams
                ? _value.streams
                : streams // ignore: cast_nullable_to_non_nullable
                      as List<StreamModel>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GradeModelImplCopyWith<$Res>
    implements $GradeModelCopyWith<$Res> {
  factory _$$GradeModelImplCopyWith(
    _$GradeModelImpl value,
    $Res Function(_$GradeModelImpl) then,
  ) = __$$GradeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, List<StreamModel>? streams});
}

/// @nodoc
class __$$GradeModelImplCopyWithImpl<$Res>
    extends _$GradeModelCopyWithImpl<$Res, _$GradeModelImpl>
    implements _$$GradeModelImplCopyWith<$Res> {
  __$$GradeModelImplCopyWithImpl(
    _$GradeModelImpl _value,
    $Res Function(_$GradeModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? streams = freezed,
  }) {
    return _then(
      _$GradeModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        streams: freezed == streams
            ? _value._streams
            : streams // ignore: cast_nullable_to_non_nullable
                  as List<StreamModel>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GradeModelImpl implements _GradeModel {
  const _$GradeModelImpl({this.id, this.name, final List<StreamModel>? streams})
    : _streams = streams;

  factory _$GradeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GradeModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  final List<StreamModel>? _streams;
  @override
  List<StreamModel>? get streams {
    final value = _streams;
    if (value == null) return null;
    if (_streams is EqualUnmodifiableListView) return _streams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GradeModel(id: $id, name: $name, streams: $streams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._streams, _streams));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_streams),
  );

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeModelImplCopyWith<_$GradeModelImpl> get copyWith =>
      __$$GradeModelImplCopyWithImpl<_$GradeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GradeModelImplToJson(this);
  }
}

abstract class _GradeModel implements GradeModel {
  const factory _GradeModel({
    final int? id,
    final String? name,
    final List<StreamModel>? streams,
  }) = _$GradeModelImpl;

  factory _GradeModel.fromJson(Map<String, dynamic> json) =
      _$GradeModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<StreamModel>? get streams;

  /// Create a copy of GradeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GradeModelImplCopyWith<_$GradeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StreamModel _$StreamModelFromJson(Map<String, dynamic> json) {
  return _StreamModel.fromJson(json);
}

/// @nodoc
mixin _$StreamModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this StreamModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StreamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreamModelCopyWith<StreamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamModelCopyWith<$Res> {
  factory $StreamModelCopyWith(
    StreamModel value,
    $Res Function(StreamModel) then,
  ) = _$StreamModelCopyWithImpl<$Res, StreamModel>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$StreamModelCopyWithImpl<$Res, $Val extends StreamModel>
    implements $StreamModelCopyWith<$Res> {
  _$StreamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StreamModelImplCopyWith<$Res>
    implements $StreamModelCopyWith<$Res> {
  factory _$$StreamModelImplCopyWith(
    _$StreamModelImpl value,
    $Res Function(_$StreamModelImpl) then,
  ) = __$$StreamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$StreamModelImplCopyWithImpl<$Res>
    extends _$StreamModelCopyWithImpl<$Res, _$StreamModelImpl>
    implements _$$StreamModelImplCopyWith<$Res> {
  __$$StreamModelImplCopyWithImpl(
    _$StreamModelImpl _value,
    $Res Function(_$StreamModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StreamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = freezed, Object? name = freezed}) {
    return _then(
      _$StreamModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StreamModelImpl implements _StreamModel {
  const _$StreamModelImpl({this.id, this.name});

  factory _$StreamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StreamModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'StreamModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of StreamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamModelImplCopyWith<_$StreamModelImpl> get copyWith =>
      __$$StreamModelImplCopyWithImpl<_$StreamModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StreamModelImplToJson(this);
  }
}

abstract class _StreamModel implements StreamModel {
  const factory _StreamModel({final int? id, final String? name}) =
      _$StreamModelImpl;

  factory _StreamModel.fromJson(Map<String, dynamic> json) =
      _$StreamModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of StreamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamModelImplCopyWith<_$StreamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
