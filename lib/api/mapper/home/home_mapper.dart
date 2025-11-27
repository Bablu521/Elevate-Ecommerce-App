import 'package:elevate_ecommerce_app/api/mapper/home/best_seller_mapper.dart';

import '../../../domin/entities/home_entity.dart';
import '../../models/responses/home_response_dto/home_response_dto.dart';

extension HomeMapper on HomeDto {
  HomeEntity toEntity() {
    return HomeEntity(
      message: message,
      categories: categories?.map((e) => e.toEntity()).toList(),
      occasions:
          occasions?.map((e) => e.toOccasOccasionEntity()).toList(),
      products: products?.map((e) => e.toProductEntity()).toList(),
      bestSeller: bestSeller?.map((e) => e.toEntity()).toList(),
    );
  }
}
