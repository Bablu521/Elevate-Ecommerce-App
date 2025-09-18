import 'package:elevate_ecommerce_app/api/client/api_client.dart';
import 'package:elevate_ecommerce_app/api/data_source/orders_remote_data_source_impl.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/order_data.dart';
import 'package:elevate_ecommerce_app/api/models/responses/order_page/orders_page.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:elevate_ecommerce_app/api/mapper/orders/orders_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/cash_order_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/credit_order_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/order_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/order_items_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/cash_order_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/responses/orders/credit_order_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'orders_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("test OrdersRemoteDataSourceImpl", () {
    late MockApiClient mockApiClient;
    late OrdersRemoteDataSourceImpl ordersRemoteDataSourceImpl;

    setUp(() {
      mockApiClient = MockApiClient();
      ordersRemoteDataSourceImpl = OrdersRemoteDataSourceImpl(mockApiClient);
    });

    test('should return success when getOrders is success', () async {
      final orderList = OrdersDto(
        id: "1",
        orderNumber: "ORD-1001",
        user: "User 1",
        state: "active",
        isDelivered: false,
        isPaid: false,
        paymentType: "cash",
        totalPrice: 150,
        createdAt: null,
        updatedAt: null,
        V: 0,
      );

      when(mockApiClient.getOrders()).thenAnswer(
        (_) async => OrdersPageDto(message: "success", orders: [orderList]),
      );

      final result = await ordersRemoteDataSourceImpl.getOrders();

      expect(result, isA<ApiSuccessResult<OrdersPageEntity>>());
      final success = result as ApiSuccessResult<OrdersPageEntity>;
      expect(success.data.message, "success");
      expect(
        success.data.orders,
        equals([
          const OrdersEntity(
            id: "1",
            orderNumber: "ORD-1001",
            user: "User 1",
            state: "active",
            isDelivered: false,
            isPaid: false,
            paymentType: "cash",
            totalPrice: 150,
            createdAt: null,
            updatedAt: null,
            V: 0,
          ),
        ]),
      );
    });

    group("test checkoutCashOrder", () {
      final expectedRequestEntity = const ShippingAddressEntity(
        street: "fake-street",
        phone: "fake-phone",
        city: "fake-city",
        lat: "fake-lat",
        long: "fake-long",
      );

      test(
        "when call checkoutCashOrder it should return CashOrderResponse from api client with right parameters",
        () async {
          final expectedResult = CashOrderResponse(
            message: "fake-message",
            order: OrderDTO(
              user: "fake-user",
              orderItems: [
                OrderItemsDTO(
                  product: ProductDto(
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
                  price: 100,
                  quantity: 1,
                  id: "fake-id",
                ),
              ],
              totalPrice: 200,
              paymentType: "fake-paymentType",
              isPaid: false,
              isDelivered: false,
              state: "fake-state",
              id: "fake-id",
              createdAt: "fake-createdAt",
              updatedAt: "fake-updatedAt",
              orderNumber: "fake-orderNumber",
              v: 1,
            ),
          );

          when(
            mockApiClient.checkoutCashOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).thenAnswer((_) async => expectedResult);

          final result = await ordersRemoteDataSourceImpl.checkoutCashOrder(
            expectedRequestEntity,
          );

          verify(
            mockApiClient.checkoutCashOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).called(1);
          expect(result, isA<ApiSuccessResult<CashOrderEntity>>());
          result as ApiSuccessResult<CashOrderEntity>;
          expect(result.data, equals(expectedResult.toEntity()));
        },
      );

      test(
        'when checkoutCashOrder failed it should return an error result',
        () async {
          final expectedError = "Server Error";
          when(
            mockApiClient.checkoutCashOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).thenThrow(Exception(expectedError));

          final result = await ordersRemoteDataSourceImpl.checkoutCashOrder(
            expectedRequestEntity,
          );

          verify(
            mockApiClient.checkoutCashOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).called(1);
          expect(result, isA<ApiErrorResult<CashOrderEntity>>());
          result as ApiErrorResult<CashOrderEntity>;
          expect(result.errorMessage, contains(expectedError));
        },
      );
    });

    group("test checkoutCreditOrder", () {
      final expectedRequestEntity = const ShippingAddressEntity(
        street: "fake-street",
        phone: "fake-phone",
        city: "fake-city",
        lat: "fake-lat",
        long: "fake-long",
      );

      test(
        "when call checkoutCreditOrder it should return CreditOrderResponse from api client with right parameters",
        () async {
          final expectedResult = CreditOrderResponse(
            message: "Order created successfully",
            session: Session(
              id: "sess_123456789",
              object: "checkout.session",
              amountSubtotal: 9000,
              amountTotal: 10000,
              currency: "usd",
              cancelUrl: "https://example.com/cancel",
              successUrl: "https://example.com/success",
              created: DateTime.now().millisecondsSinceEpoch ~/ 1000,
              livemode: false,
              mode: "payment",
              paymentStatus: "unpaid",
              url: "https://checkout.stripe.com/pay/abc123",
              paymentMethodTypes: ["card"],
              customerEmail: "test@example.com",
              metadata: Metadata(
                city: "Cairo",
                lat: "30.033333",
                long: "31.233334",
                phone: "+201234567890",
                street: "Fake Street 123",
              ),
              adaptivePricing: AdaptivePricing(enabled: false),
              automaticTax: AutomaticTax(
                enabled: false,
                liability: null,
                provider: null,
                status: null,
              ),
              collectedInformation: CollectedInformation(shippingDetails: null),
              customText: CustomText(
                afterSubmit: null,
                shippingAddress: null,
                submit: null,
                termsOfServiceAcceptance: null,
              ),
              customerDetails: CustomerDetails(
                email: "test@example.com",
                taxExempt: "none",
              ),
              invoiceCreation: InvoiceCreation(
                enabled: true,
                invoiceData: InvoiceData(),
              ),
              paymentMethodConfigurationDetails:
                  PaymentMethodConfigurationDetails(id: "pmcd_123"),
              paymentMethodOptions: PaymentMethodOptions(
                card: Card(requestThreeDSecure: "any"),
              ),
              phoneNumberCollection: PhoneNumberCollection(enabled: true),
              totalDetails: TotalDetails(
                amountDiscount: 1000,
                amountShipping: 0,
                amountTax: 0,
              ),
            ),
          );

          when(
            mockApiClient.checkoutCreditOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).thenAnswer((_) async => expectedResult);

          final result = await ordersRemoteDataSourceImpl.checkoutCreditOrder(
            expectedRequestEntity,
          );

          verify(
            mockApiClient.checkoutCreditOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).called(1);
          expect(result, isA<ApiSuccessResult<CreditOrderEntity>>());
          result as ApiSuccessResult<CreditOrderEntity>;
          expect(result.data, equals(expectedResult.toEntity()));
        },
      );

      test(
        'when checkoutCreditOrder failed it should return an error result',
        () async {
          final expectedError = "Server Error";
          when(
            mockApiClient.checkoutCreditOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).thenThrow(Exception(expectedError));

          final result = await ordersRemoteDataSourceImpl.checkoutCreditOrder(
            expectedRequestEntity,
          );

          verify(
            mockApiClient.checkoutCreditOrder(
              expectedRequestEntity.toOrderRequest(),
            ),
          ).called(1);
          expect(result, isA<ApiErrorResult<CreditOrderEntity>>());
          result as ApiErrorResult<CreditOrderEntity>;
          expect(result.errorMessage, contains(expectedError));
        },
      );
    });
  });
}


