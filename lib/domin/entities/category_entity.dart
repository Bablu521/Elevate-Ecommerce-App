import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;
  final int? productsCount;

  const CategoryEntity({
    this.id,
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
    id,
    name,
    slug,
    image,
    createdAt,
    updatedAt,
    isSuperAdmin,
    productsCount,
  ];
}
