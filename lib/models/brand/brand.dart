import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.freezed.dart';
part 'brand.g.dart';

@freezed
class Brand with _$Brand {
  const factory Brand({
    int? id, //Лишнее?
    int? companyId, //Лишнее?
    //Company? company, //Лишнее?
    String? name,
    List<String>? restaurants, //Лишнее?
  }) = _Brand;

  factory Brand.fromJson(Map<String, Object?> json) => _$BrandFromJson(json);
}
