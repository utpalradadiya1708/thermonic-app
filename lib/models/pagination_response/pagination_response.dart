import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thermonic/models/trainer_model_response/trainer_model_response.dart';

part 'pagination_response.freezed.dart';
part 'pagination_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginationResponse<T> with _$PaginationResponse<T> {
  factory PaginationResponse({
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "is_ordered") bool? isOrdered,
    @JsonKey(name: "order_id") int? orderId,
    @JsonKey(name: "subject_name") String? subjectName,
    @JsonKey(name: "grade_name") String? gradeName,
    @JsonKey(name: "stream_name") String? streamName,
    TrainerModelResponse? trainer,
    String? price,
    required List<T> results,
  }) = _PaginationResponse<T>;

  /// Used when the key for the list is not fixed
  static PaginationResponse<T> fromJsonWithDynamicKey<T>(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    const possibleKeys = [
      'subjects',
      'exams',
      'chapters',
      'order',
      'notifications',
      'chat_history',
      // Add more as needed
    ];

    List<dynamic>? itemsList;
    for (final key in possibleKeys) {
      if (json.containsKey(key) && json[key] is List) {
        itemsList = json[key] as List;
        break;
      }
    }

    if (itemsList == null) {
      throw FormatException(
        'No valid list key found in JSON. Looked for: $possibleKeys\nFull JSON: $json',
      );
    }

    return PaginationResponse<T>(
      totalPages: json['total_pages'] as int,
      price: json['price'] as String?,
      orderId: json['order_id'] as int?,
      isOrdered: json['is_ordered'] as bool?,
      results: itemsList.map((e) => fromJsonT(e)).toList(),
    );
  }

  /// Default factory for generic deserialization
  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginationResponseFromJson(json, fromJsonT);
}
