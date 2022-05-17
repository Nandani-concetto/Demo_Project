import 'dart:convert';

import 'logger.dart';

class CustomConvert {
  static double? dConvertor(dynamic milliseconds) {
    if (milliseconds == null) {
      return null;
    }
    if (milliseconds is int) return milliseconds.toDouble();
    if (milliseconds is String) return double.parse(milliseconds);
    return milliseconds as double;
  }

  static String? sConvertor(dynamic milliseconds) {
    if (milliseconds == null) {
      return null;
    }
    if (milliseconds is int) return milliseconds.toString();
    if (milliseconds is String) return milliseconds;
    return milliseconds.toString();
  }

  static int? iConvertor(dynamic milliseconds) {
    try {
      if (milliseconds == null) {
        return null;
      }
      if (milliseconds is double) return milliseconds.round();
      if (milliseconds is String) return int.tryParse(milliseconds) ?? 0;
      if (milliseconds is int) return milliseconds;
      return null;
    } on Exception catch (e) {
      Logger.write("@30 can not convert $e");
      return null;
    }
  }

  static String? jConvertor(dynamic milliseconds) {
    return jsonEncode(milliseconds);
  }

  static double dNConvertor(dynamic milliseconds) {
    double? sDouble = dConvertor(milliseconds);
    if (sDouble == null) {
      return 0.00;
    }
    return sDouble;
  }
}
