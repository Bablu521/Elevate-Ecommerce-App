import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_product_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BestSellerResponseDto extends Equatable {
  final String? message;
  final List<BestSellerProductDto>? bestSeller;

  const BestSellerResponseDto({this.message, this.bestSeller});

  factory BestSellerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BestSellerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, bestSeller];
}
