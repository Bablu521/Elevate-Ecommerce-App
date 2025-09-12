import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String? id;
  final String? nameEn;
  final String? nameAr;

  const CityEntity({required this.id, required this.nameEn, required this.nameAr});

  @override
  List<Object?> get props => [id,nameEn,nameAr];
}