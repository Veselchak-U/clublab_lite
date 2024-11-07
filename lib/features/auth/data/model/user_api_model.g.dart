// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      birthDate: json['birth_date'] as String?,
      gender:
          const SexTypeConverter().fromJson((json['gender'] as num?)?.toInt()),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'birth_date': instance.birthDate,
      'gender': const SexTypeConverter().toJson(instance.gender),
      'token': instance.token,
    };
