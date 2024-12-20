import 'package:clublab_lite/common/utils/string_ext.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

extension DateTimeExt on DateTime? {
  bool isOnTheSameDay(DateTime other) {
    return this?.year == other.year && this?.month == other.month && this?.day == other.day;
  }

  String get longDate {
    final date = this;
    if (date == null) return '';

    return DateFormat('dd.MM.yyyy').format(date);
  }

  String toServerFormat() {
    final date = this;
    if (date == null) return '';

    return DateFormat('dd.MM.yyyy').format(date).toString();
  }

  String timeShort() {
    final date = this;
    if (date == null) return '';

    return DateFormat('hh:mm aaa').format(date).toString();
  }
}

class ConvertDateTime implements JsonConverter<DateTime?, String?> {
  const ConvertDateTime();

  @override
  DateTime? fromJson(String? value) {
    return value.toDate();
  }

  @override
  String? toJson(DateTime? value) {
    if (value == null) return null;

    return DateFormat('yyyy-MM-dd').format(value);
  }
}

class ConvertDateTimestamp implements JsonConverter<DateTime?, int?> {
  const ConvertDateTimestamp();

  @override
  DateTime? fromJson(int? value) {
    if (value == null) return null;

    return DateTime.fromMillisecondsSinceEpoch(value).toLocal();
  }

  @override
  int? toJson(DateTime? value) {
    if (value == null) return null;

    return value.toUtc().millisecondsSinceEpoch;
  }
}
