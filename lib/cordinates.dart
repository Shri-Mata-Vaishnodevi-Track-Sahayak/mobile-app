import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Cordinate {
  double? latitude;
  double? longitude;
  List<String> type = [];

  Cordinate(this.latitude, this.longitude, this.type);

  factory Cordinate.fromJson(Map<String, dynamic> json) => _$CordinateFromJson(json);
  Map<String, dynamic> toJson() => _$CordinateToJson(this);
}
