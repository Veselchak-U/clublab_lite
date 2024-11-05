import 'package:clublab_lite/common/utils/date_time_ext.dart';
import 'package:clublab_lite/features/initial/data/model/sex_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class UserApiModel {
  final int id;
  final String? name;
  final String? phone;
  final String? email;
  @ConvertDateTime()
  final String? birthDate;
  @SexTypeConverter()
  final SexType? gender;

  UserApiModel({
    required this.id,
    this.name,
    this.phone,
    this.email,
    this.birthDate,
    this.gender,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return _$UserApiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);
}
