import 'package:elevate_ecommerce_app/api/models/responses/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_dto.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetaData? metadata;
  @JsonKey(name: "categories")
  final List<CategoryDTO>? categories;

  CategoriesResponse({this.message, this.metadata, this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesResponseToJson(this);
  }
}
