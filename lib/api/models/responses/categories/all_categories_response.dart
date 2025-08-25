import 'package:elevate_ecommerce_app/api/models/responses/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_dto.dart';

part 'all_categories_response.g.dart';

@JsonSerializable()
class AllCategoriesResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetaData? metadata;
  @JsonKey(name: "categories")
  final List<CategoryDTO>? categories;

  AllCategoriesResponse({this.message, this.metadata, this.categories});

  factory AllCategoriesResponse.fromJson(Map<String, dynamic> json) {
    return _$AllCategoriesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllCategoriesResponseToJson(this);
  }
}
