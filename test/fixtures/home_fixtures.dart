import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/best_seller/best_seller_response_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';

abstract class HomeFixtures {
  static BestSellerResponseDto fakeProductsResponse =
      const BestSellerResponseDto(
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
  static AddProductToCartRequestEntity addToCartRequestEntity =
      const AddProductToCartRequestEntity(product: "fake_id", quantity: 1);
  static CartResponseEntity fakeCartResponseEntity = CartResponseEntity(
    cart: CartEntity(
      appliedCoupons: [],
      cartItems: [],
      createdAt: DateTime.now(),
      id: "fake_id",
      totalPrice: 100,
      updatedAt: DateTime.now(),
      user: "fake_user",
      v: 1,
    ),
    numOfCartItems: 1,
    message: "fake_message",
  );
}
