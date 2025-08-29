
import '../../api/models/responses/home_response_dto/home_response_dto.dart';
import '../../domin/entities/home_entity.dart';


extension HomeMapper on HomeDto{
  HomeEntity toEntity(){
    return HomeEntity(

      message: message,
      categories: categories?.map((e) => e.toCategoriesEntity()).toList() ?? [],
      occasions: occasions?.map((e)=>e.toOccasOccasionEntity()).toList()??[],
      products: products?.map((e)=>e.toProductEntity()).toList()??[],
      bestSeller: bestSeller?.map((e) =>e.toBestSellerEntity()).toList()??[],
    );
  }
}