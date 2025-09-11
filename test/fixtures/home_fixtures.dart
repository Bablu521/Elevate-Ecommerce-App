import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_response_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';

abstract class HomeFixtures {
  static BestSellerResponseDto fakeProductsResponse = const BestSellerResponseDto(
    message: "success",
    bestSeller: [
      BestSellerProductDto(
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
      BestSellerProductDto(
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
  );

  static BestSellerProductEntity fakeProduct = const BestSellerProductEntity(
    rateAvg: 4,
    rateCount: 120,
    id: "p1",
    title: "Wireless Headphones",
    slug: "wireless-headphones",
    description: "High-quality wireless headphones with noise cancellation.",
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
  );
  static List<BestSellerProductEntity> fakeListProductEntity = [
    fakeProduct,
    fakeProduct,
    fakeProduct,
  ];
}
