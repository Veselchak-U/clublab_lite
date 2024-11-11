import 'package:clublab_lite/common/utils/date_time_ext.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_record_api_model.g.dart';

@JsonSerializable()
class GameRecordApiModel {
  final int id;
  final String description;
  final String name;
  final String fieldName;
  @ConvertDateTimestamp()
  @JsonKey(name: 'created_timestamp')
  final DateTime? created;
  final String url;

  const GameRecordApiModel({
    required this.id,
    required this.description,
    required this.name,
    required this.fieldName,
    required this.created,
    required this.url,
  });

  factory GameRecordApiModel.fromJson(Map<String, dynamic> json) {
    return _$GameRecordApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameRecordApiModelToJson(this);
}
