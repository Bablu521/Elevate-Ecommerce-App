import 'package:dio/dio.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/all_categories_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/products/all_products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_end_points.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiEndPoints.categories)
  Future<AllCategoriesResponse> getAllCategories();

  @GET(ApiEndPoints.products)
  Future<AllProductsResponse> getAllProducts();

  @GET(ApiEndPoints.products)
  Future<AllProductsResponse> getProductsByCategory(
    @Query("category") String category,
  );

  @GET(ApiEndPoints.products)
  Future<AllProductsResponse> getProductsByOccasion(
    @Query("occasion") String occasion,
  );
}
