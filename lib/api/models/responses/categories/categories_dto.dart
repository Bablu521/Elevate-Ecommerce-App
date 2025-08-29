import 'package:elevate_ecommerce_app/domin/entities/categories_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_dto.g.dart';

@JsonSerializable()
class CategoriesDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "isSuperAdmin")
  final bool? isSuperAdmin;

  CategoriesDto ({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
  });

  factory CategoriesDto.fromJson(Map<String, dynamic> json) {
    return _$CategoriesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesDtoToJson(this);
  }

  CategoriesEntity toCategoriesEntity(){
    return CategoriesEntity(
      Id: Id,
      name:name,
      slug:slug,
      image:image,
      createdAt:createdAt,
      updatedAt:updatedAt,
      isSuperAdmin:isSuperAdmin,
    );

  }
}