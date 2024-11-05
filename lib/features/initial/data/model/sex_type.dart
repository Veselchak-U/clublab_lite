import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:json_annotation/json_annotation.dart';

enum SexType {
  male(),
  female();

  const SexType();

  @override
  String toString() => switch (this) {
        SexType.male => l10n?.male ?? '',
        SexType.female => l10n?.female ?? '',
      };
}

class SexTypeConverter implements JsonConverter<SexType?, int?> {
  const SexTypeConverter();

  @override
  SexType? fromJson(int? value) {
    return switch (value) {
      1 => SexType.male,
      2 => SexType.female,
      _ => null,
    };
  }

  @override
  int? toJson(SexType? value) {
    return switch (value) {
      SexType.male => 1,
      SexType.female => 2,
      _ => null,
    };
  }
}
