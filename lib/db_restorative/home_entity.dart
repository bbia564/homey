import 'dart:typed_data';

import 'package:intl/intl.dart';

class HomeEntity {
  int id;
  DateTime createdTime;
  int type;
  Uint8List image;
  String name;
  DateTime finishTime;
  int hadWarn;

  HomeEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.image,
    required this.name,
    required this.finishTime,
    required this.hadWarn,
  });

  factory HomeEntity.fromJson(Map<String, dynamic> json) {
    return HomeEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      image: json['image'],
      name: json['name'],
      finishTime: DateTime.parse(json['finishTime']),
      hadWarn: json['hadWarn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'type': type,
      'image': image,
      'name': name,
      'finishTime': finishTime.toIso8601String(),
      'hadWarn': hadWarn,
    };
  }

  String get finishTimeString {
    return DateFormat('yyyy-MM-dd').format(finishTime);
  }
}