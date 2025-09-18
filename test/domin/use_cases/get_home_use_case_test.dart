import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/repositories/home/home_repo.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_home_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_home_use_case_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  group("test GetHomeUseCase", () {
    late MockHomeRepo mockHomeRepo;
    late GetHomeUseCase getHomeUseCase;

    setUp(() {
      mockHomeRepo = MockHomeRepo();
      getHomeUseCase = GetHomeUseCase(homeRepo: mockHomeRepo);
    });

    test(
      'when call it should return HomeEntity from repo with right parameters',
      () async {
        final expectedEntity = HomeEntity(
          message: "fake-message",
          products: [
            ProductEntity(
              rateAvg: 5,
              rateCount: 10,
              id: "fake-id",
              title: "fake-title",
              slug: "fake-slug",
              description: "fake-description",
              imgCover: "fake-imgCover",
              images: const ["fake-image1", "fake-image2"],
              price: 100,
              priceAfterDiscount: 80,
              quantity: 50,
              category: "fake-category",
              occasion: "fake-occasion",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              v: 1,
              isSuperAdmin: false,
              sold: 20,
            ),
            ProductEntity(
              rateAvg: 4,
              rateCount: 5,
              id: "fake-id-2",
              title: "fake-title-2",
              slug: "fake-slug-2",
              description: "fake-description-2",
              imgCover: "fake-imgCover-2",
              images: ["fake-image3", "fake-image4"],
              price: 200,
              priceAfterDiscount: 150,
              quantity: 30,
              category: "fake-category-2",
              occasion: "fake-occasion-2",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              v: 1,
              isSuperAdmin: false,
              sold: 10,
            ),
          ],
          categories: const [
            CategoryEntity(
              id: "fake-id-1",
              name: "fake-name-1",
              slug: "fake-slug-1",
              image: "fake-image-1",
              createdAt: "fake-created-at-1",
              updatedAt: "fake-updated-at-1",
              isSuperAdmin: false,
              productsCount: 1,
            ),
            CategoryEntity(
              id: "fake-id-2",
              name: "fake-name-2",
              slug: "fake-slug-2",
              image: "fake-image-2",
              createdAt: "fake-created-at-2",
              updatedAt: "fake-updated-at-2",
              isSuperAdmin: false,
              productsCount: 2,
            ),
          ],
          bestSeller: const [
            BestSellerProductEntity(
              rateAvg: 4,
              rateCount: 120,
              id: "p1",
              title: "Wireless Headphones",
              slug: "wireless-headphones",
              description:
                  "High-quality wireless headphones with noise cancellation.",
              imgCover: "https://picsum.photos/200/300?random=1",
              images: [
                "https://picsum.photos/200/300?random=2",
                "https://picsum.photos/200/300?random=3",
              ],
              price: 1500,
              priceAfterDiscount: 1200,
              quantity: 50,
              category: "Electronics",
              occasion: "Daily Use",
              createdAt: "",
              updatedAt: "",
              isSuperAdmin: false,
              sold: 35,
            ),
            BestSellerProductEntity(
              rateAvg: 4,
              rateCount: 120,
              id: "p1",
              title: "Wireless Headphones",
              slug: "wireless-headphones",
              description:
                  "High-quality wireless headphones with noise cancellation.",
              imgCover: "https://picsum.photos/200/300?random=1",
              images: [
                "https://picsum.photos/200/300?random=2",
                "https://picsum.photos/200/300?random=3",
              ],
              price: 1500,
              priceAfterDiscount: 1200,
              quantity: 50,
              category: "Electronics",
              occasion: "Daily Use",
              createdAt: "",
              updatedAt: "",
              isSuperAdmin: false,
              sold: 35,
            ),
          ],
          occasions: [
            OccasionEntity(
              id: "fake-id-1",
              name: "fake-name-1",
              slug: "fake-slug-1",
              image: "fake-image-1",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isSuperAdmin: false,
              productsCount: 0,
            ),
            OccasionEntity(
              id: "fake-id-2",
              name: "fake-name-2",
              slug: "fake-slug-2",
              image: "fake-image-2",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isSuperAdmin: false,
              productsCount: 0,
            ),
          ],
        );

        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<HomeEntity>>(expectedResult);
        when(mockHomeRepo.getHome()).thenAnswer((_) async => expectedResult);

        final result = await getHomeUseCase();

        verify(mockHomeRepo.getHome()).called(1);
        expect(result, isA<ApiSuccessResult<HomeEntity>>());
        result as ApiSuccessResult<HomeEntity>;
        expect(result.data, equals(expectedEntity));
      },
    );

    test("when call failed it should return an error result", () async {
      final expectedError = "Server Error";
      final expectedResult = ApiErrorResult<HomeEntity>(expectedError);
      provideDummy<ApiResult<HomeEntity>>(expectedResult);
      when(mockHomeRepo.getHome()).thenAnswer((_) async => expectedResult);

      final result = await getHomeUseCase();

      verify(mockHomeRepo.getHome()).called(1);
      expect(result, isA<ApiErrorResult<HomeEntity>>());
      result as ApiErrorResult<HomeEntity>;
      expect(result.errorMessage, equals(expectedError));
    });
  });
}
