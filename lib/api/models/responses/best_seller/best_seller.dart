
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller.g.dart';
@JsonSerializable()
class BestSellerDto {
  @JsonKey(name: "rateAvg")
  final int? rateAvg;
  @JsonKey(name: "rateCount")
  final int? rateCount;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imgCover")
  final String? imgCover;
  @JsonKey(name: "images")
  final List<String>? images;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "priceAfterDiscount")
  final int? priceAfterDiscount;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "occasion")
  final String? occasion;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "__v")
  final int? V;
  @JsonKey(name: "isSuperAdmin")
  final bool? isSuperAdmin;
  @JsonKey(name: "sold")
  final int? sold;
  @JsonKey(name: "id")
  final String? id;

  BestSellerDto ({
    this.rateAvg,
    this.rateCount,
    this.Id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.V,
    this.isSuperAdmin,
    this.sold,
    this.id,
  });

  factory BestSellerDto.fromJson(Map<String, dynamic> json) {
    return _$BestSellerDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BestSellerDtoToJson(this);
  }


  BestSellerEntity toBestSellerEntity(){
    return BestSellerEntity(
      rateAvg:rateAvg,
      rateCount:rateCount,
      Id:Id,
      title:title,
      slug:slug,
     description:description,
      imgCover:imgCover,
     images:images,
      price:price,
      priceAfterDiscount:priceAfterDiscount,
     quantity:quantity,
      category:category,
      occasion:occasion,
      createdAt:createdAt,
      updatedAt:updatedAt,
      V:V,
     isSuperAdmin:isSuperAdmin,
      sold:sold,
      id:id,

    );
  }
}