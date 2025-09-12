//
// import 'package:bloc_test/bloc_test.dart';
// import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
// import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
// import 'package:elevate_ecommerce_app/domin/entities/categories_entity.dart';
// import 'package:elevate_ecommerce_app/domin/entities/home_entity.dart';
// import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
// import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
// import 'package:elevate_ecommerce_app/domin/use_cases/home/get_home_use_case.dart';
// import 'package:elevate_ecommerce_app/presentation/home/view_models/home_event.dart';
// import 'package:elevate_ecommerce_app/presentation/home/view_models/home_states.dart';
// import 'package:elevate_ecommerce_app/presentation/home/view_models/home_view_model.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
//
// import 'home_view_model_test.mocks.dart';
//
// @GenerateMocks([GetHomeUseCase])
// void main() {
//   group("call do intent with OnLoadHomeListEvent then get home", () {
//
//     late MockGetHomeUseCase mockUseCase;
//
//
//     late List<CategoriesEntity> categories;
//     late List<BestSellerEntity> bestSeller;
//     late List<ProductEntity> product;
//     late List<OccasionEntity> occasion;
//     late ApiResult<HomeEntity> homeResponse;
//
//     setUp(() {
//       mockUseCase = MockGetHomeUseCase();
//
//       categories = [
//         CategoriesEntity(Id: "1", name: "mo", image: "sdsf", slug: 'category-1'),
//         CategoriesEntity(Id: "2", name: "vo", image: "saa", slug: 'category-2'),
//       ];
//
//       bestSeller = [
//         BestSellerEntity(
//           Id: "3",
//           id: "3",
//           title: "Best Seller Product",
//           slug: "best-seller-product",
//           description: "This is a best seller product used for testing.",
//           imgCover: "https://example.com/product-cover.png",
//           images: [
//             "https://example.com/product-1.png",
//             "https://example.com/product-2.png",
//           ],
//           price: 200,
//           priceAfterDiscount: 150,
//           quantity: 20,
//           category: "Cosmetics",
//           occasion: "Daily Use",
//           rateAvg: 5,
//           rateCount: 100,
//           createdAt: "2025-08-28T12:00:00Z",
//           updatedAt: "2025-08-28T12:00:00Z",
//           V: 1,
//           isSuperAdmin: false,
//           sold: 50,
//         ),
//         BestSellerEntity(
//           Id: "4",
//           id: "4",
//           title: "Best Seller Product 2",
//           slug: "best-seller-2",
//           description: "This is the second best seller product.",
//           imgCover: "https://example.com/product2-cover.png",
//           images: [
//             "https://example.com/product2-img1.png",
//             "https://example.com/product2-img2.png",
//           ],
//           price: 300,
//           priceAfterDiscount: 250,
//           quantity: 15,
//           category: "Medicine",
//           occasion: "Special Care",
//           rateAvg: 4,
//           rateCount: 50,
//           createdAt: "2025-08-28T12:05:00Z",
//           updatedAt: "2025-08-28T12:05:00Z",
//           V: 1,
//           isSuperAdmin: false,
//           sold: 30,
//         ),
//       ];
//
//       product = [
//         ProductEntity(
//           id: "p1",
//           title: "Smartphone",
//           slug: "smartphone",
//           description: "Latest smartphone model",
//           imgCover: "https://example.com/smartphone.png",
//           images: ["https://example.com/smartphone-1.png"],
//           price: 1000,
//           priceAfterDiscount: 900,
//           quantity: 20,
//           category: "Electronics",
//           occasion: "Daily Use",
//           rateAvg: 4,
//           rateCount: 300,
//           createdAt: DateTime.now(),
//           updatedAt: DateTime.now(),
//           v: 1,
//           isSuperAdmin: false,
//           sold: 120,
//         ),
//         ProductEntity(
//           id: "p2",
//           title: "Headphones",
//           slug: "headphones",
//           description: "Wireless noise-cancelling headphones",
//           imgCover: "https://example.com/headphones.png",
//           images: ["https://example.com/headphones-1.png"],
//           price: 500,
//           priceAfterDiscount: 400,
//           quantity: 15,
//           category: "Electronics",
//           occasion: "Music",
//           rateAvg: 5,
//           rateCount: 150,
//           createdAt: DateTime.now(),
//           updatedAt: DateTime.now(),
//           v: 1,
//           isSuperAdmin: false,
//           sold: 75,
//         ),
//       ];
//
//       occasion = [
//         OccasionEntity(
//           id: "1",
//           name: "Wedding",
//           slug: "wedding",
//           image: "https://example.com/wedding.png",
//           createdAt: DateTime.parse("2025-08-28T12:00:00Z"),
//           updatedAt: DateTime.parse("2025-08-28T12:00:00Z"),
//           isSuperAdmin: false,
//           productsCount: 10,
//         ),
//         OccasionEntity(
//           id: "2",
//           name: "Birthday",
//           slug: "birthday",
//           image: "https://example.com/birthday.png",
//           createdAt: DateTime.parse("2025-08-28T13:00:00Z"),
//           updatedAt: DateTime.parse("2025-08-28T13:00:00Z"),
//           isSuperAdmin: false,
//           productsCount: 5,
//         ),
//       ];
//
//       homeResponse = ApiSuccessResult<HomeEntity>(
//         HomeEntity(
//           categories: categories,
//           bestSeller: bestSeller,
//           occasions: occasion,
//           products: product,
//           message: "asef",
//         ),
//       );
//     });
//
//     blocTest<HomeViewModel, HomeStates>(
//       'call do intent with OnLoadHomeListEvent then get home',
//       build: () {
//         provideDummy<ApiResult<HomeEntity>>(homeResponse);
//         when(mockUseCase.call()).thenAnswer((_) async => homeResponse);
//         return HomeViewModel(mockUseCase);
//       },
//       act: (viewModel) => viewModel.doIntent(OnLoadHomeListEvent()),
//       expect: () => [
//         HomeStates(
//           homeListIsLoading: true,
//           homeListErrorMessage: null,
//           categoriesListSuccess: const [],
//           bestSellerListSuccess: const [],
//           occasionListSuccess: const [],
//           productListSuccess: const [],
//         ),
//         HomeStates(
//           homeListIsLoading: false,
//           homeListErrorMessage: null,
//           categoriesListSuccess: categories,
//           bestSellerListSuccess: bestSeller,
//           occasionListSuccess: occasion,
//           productListSuccess: product,
//         ),
//       ],
//       verify: (_) {
//         verify(mockUseCase.call()).called(1);
//       },
//     );
//
//     blocTest<HomeViewModel, HomeStates>(
//       'call do intent with OnLoadHomeListEvent then get error',
//
//       build: () {
//         provideDummy<ApiResult<HomeEntity>>(
//           ApiErrorResult<HomeEntity>("Some error happened"),
//         );
//
//         when(mockUseCase.call()).thenAnswer(
//               (_) async => ApiErrorResult<HomeEntity>("Some error happened"),
//         );
//
//         return HomeViewModel(mockUseCase);
//       },
//
//       act: (viewModel) => viewModel.doIntent(OnLoadHomeListEvent()),
//       expect: () => [
//
//         HomeStates(
//           homeListIsLoading: true,
//           homeListErrorMessage: null,
//           categoriesListSuccess: const [],
//           bestSellerListSuccess: const [],
//           occasionListSuccess: const [],
//           productListSuccess: const [],
//         ),
//
//         HomeStates(
//           homeListIsLoading: false,
//           homeListErrorMessage: "Some error happened",
//           categoriesListSuccess: const [],
//           bestSellerListSuccess: const [],
//           occasionListSuccess: const [],
//           productListSuccess: const [],
//         ),
//       ],
//       verify: (_) {
//         verify(mockUseCase.call()).called(1);
//       },
//     );
//
//   });
// }
