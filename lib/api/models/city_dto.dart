import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:equatable/equatable.dart';

class CityDto extends Equatable {
  final String id;
  final String nameEn;
  final String nameAr;

  const CityDto({required this.id, required this.nameEn, required this.nameAr});

  factory CityDto.fromJson(Map<String, dynamic> json) {
    return CityDto(
      id: json['id'].toString(),
      nameEn: json['governorate_name_en'] ?? '',
      nameAr: json['governorate_name_ar'] ?? '',
    );
  }

  CityEntity toEntity() => CityEntity(id: id, nameEn: nameEn, nameAr: nameAr);

  @override
  List<Object?> get props => [id, nameEn, nameAr];
}
