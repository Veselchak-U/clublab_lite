// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameRecordApiModel _$GameRecordApiModelFromJson(Map<String, dynamic> json) =>
    GameRecordApiModel(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      name: json['name'] as String,
      fieldName: json['field_name'] as String,
      created: const ConvertDateTimestamp()
          .fromJson((json['created_timestamp'] as num?)?.toInt()),
      url: json['url'] as String,
    );

Map<String, dynamic> _$GameRecordApiModelToJson(GameRecordApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'name': instance.name,
      'field_name': instance.fieldName,
      'created_timestamp':
          const ConvertDateTimestamp().toJson(instance.created),
      'url': instance.url,
    };
