import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:equatable/equatable.dart';

class AreaDto extends Equatable {
  final String id;
  final String cityId;
  final String nameEn;
  final String nameAr;

  const AreaDto({
    required this.id,
    required this.cityId,
    required this.nameEn,
    required this.nameAr,
  });

  factory AreaDto.fromJson(Map<String, dynamic> json) {
    return AreaDto(
      id: json['id'].toString(),
      cityId: json['governorate_id'].toString(),
      nameEn: json['city_name_en'] ?? '',
      nameAr: json['city_name_ar'] ?? '',
    );
  }

  AreaEntity toEntity() =>
      AreaEntity(id: id, cityId: cityId, nameEn: nameEn, nameAr: nameAr);
      
        @override
        List<Object?> get props => [id,cityId,nameEn,nameAr];
}
