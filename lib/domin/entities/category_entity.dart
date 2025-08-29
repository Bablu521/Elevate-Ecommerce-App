import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? Id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;
  final int? productsCount;

  CategoryEntity({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
    this.productsCount,
  });

  @override
  List<Object?> get props => [
    Id,
    name,
    slug,
    image,
    createdAt,
    updatedAt,
    isSuperAdmin,
    productsCount,
  ];
}
