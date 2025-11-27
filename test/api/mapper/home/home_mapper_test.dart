import 'package:elevate_ecommerce_app/api/mapper/home/best_seller_mapper.dart';
import 'package:elevate_ecommerce_app/api/mapper/home/home_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/occasion_dto.dart';
import 'package:elevate_ecommerce_app/api/models/product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/categories/category_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/home_response_dto/home_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test HomeMapper", () {
    test(
      'when call toEntity with null values it should return HomeEntity with null values',
      () async {
        final expectedResult = HomeDto(
          message: null,
          products: null,
          categories: null,
          bestSeller: null,
          occasions: null,
        );

        final result = expectedResult.toEntity();

        expect(result.message, null);
        expect(result.products, null);
        expect(result.categories, null);
        expect(result.bestSeller, null);
        expect(result.occasions, null);
      },
    );

    test(
      'when call toEntity with right values it should return HomeEntity with right values',
      () {
        final expectedResult = HomeDto(
          message: "fake-message",
          products: [
            ProductDto(
              rateAvg: 5,
              rateCount: 10,
              id: "fake-id",
              title: "fake-title",
              slug: "fake-slug",
              description: "fake-description",
              imgCover: "fake-imgCover",
              images: ["fake-image1", "fake-image2"],
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
            ProductDto(
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
          categories: [
            CategoryDTO(
              id: "fake-id-1",
              name: "fake-name-1",
              slug: "fake-slug-1",
              image: "fake-image-1",
              createdAt: "fake-created-at-1",
              updatedAt: "fake-updated-at-1",
              isSuperAdmin: false,
              productsCount: 1,
            ),
            CategoryDTO(
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
          bestSeller: [
            const BestSellerProductDto(
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
            const BestSellerProductDto(
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
            OccasionDto(
              id: "fake-id-1",
              name: "fake-name-1",
              slug: "fake-slug-1",
              image: "fake-image-1",
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
              isSuperAdmin: false,
              productsCount: 0,
            ),
            OccasionDto(
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

        final result = expectedResult.toEntity();

        expect(result.message, expectedResult.message);
        expect(
          result.products,
          expectedResult.products?.map((e) => e.toProductEntity()).toList(),
        );
        expect(
          result.categories,
          expectedResult.categories?.map((e) => e.toEntity()).toList(),
        );
        expect(
          result.bestSeller,
          expectedResult.bestSeller?.map((e) => e.toEntity()).toList(),
        );
        expect(
          result.occasions,
          expectedResult.occasions
              ?.map((e) => e.toOccasOccasionEntity())
              .toList(),
        );
      },
    );
  });
}
