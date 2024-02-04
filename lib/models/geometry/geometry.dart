import 'package:freezed_annotation/freezed_annotation.dart';

part 'geometry.freezed.dart';
part 'geometry.g.dart';

@freezed
class Geometry with _$Geometry {
  const factory Geometry({
    String? type,
    List<double>? coordinates,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, Object?> json) => _$GeometryFromJson(json);
}


// class Geometry {
//   String? type;
//   List<double>? coordinates;

//   Geometry({this.type, this.coordinates});

//   Geometry.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     coordinates = json['coordinates'].cast<double>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['coordinates'] = this.coordinates;
//     return data;
//   }
// }