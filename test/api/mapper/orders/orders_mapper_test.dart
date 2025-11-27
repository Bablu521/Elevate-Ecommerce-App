import 'package:elevate_ecommerce_app/api/mapper/orders/orders_mapper.dart';
import 'package:elevate_ecommerce_app/api/models/product_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/cash_order_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/credit_order_response.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/order_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/orders/order_items_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/orders/shipping_address_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test OrdersMapper", () {
    group("test ShippingAddressMapper", () {
      test(
        'when call toOrderRequest with null values it should return OrderRequest with null values',
        () async {
          final expectedResult = const ShippingAddressEntity(
            street: null,
            phone: null,
            city: null,
            lat: null,
            long: null,
          );

          final result = expectedResult.toOrderRequest();

          expect(result.shippingAddress?.street, null);
          expect(result.shippingAddress?.phone, null);
          expect(result.shippingAddress?.city, null);
          expect(result.shippingAddress?.lat, null);
          expect(result.shippingAddress?.long, null);
        },
      );

      test(
        'when call toOrderRequest with right values it should return OrderRequest with right values',
        () {
          final expectedResult = const ShippingAddressEntity(
            street: "fake-street",
            phone: "fake-phone",
            city: "fake-city",
            lat: "fake-lat",
            long: "fake-long",
          );

          final result = expectedResult.toOrderRequest();

          expect(result.shippingAddress?.street, expectedResult.street);
          expect(result.shippingAddress?.phone, expectedResult.phone);
          expect(result.shippingAddress?.city, expectedResult.city);
          expect(result.shippingAddress?.lat, expectedResult.lat);
          expect(result.shippingAddress?.long, expectedResult.long);
        },
      );
    });

    group("test AddressRequestMapper", () {
      test(
        'when call toShippingAddressEntity with null values it should return ShippingAddressEntity with null values',
        () async {
          final expectedResult = const AddressEntity(
            street: null,
            phone: null,
            city: null,
            lat: null,
            long: null,
            username: null,
            id: null,
          );

          final result = expectedResult.toShippingAddressEntity();

          expect(result.street, null);
          expect(result.phone, null);
          expect(result.city, null);
          expect(result.lat, null);
          expect(result.long, null);
        },
      );

      test(
        'when call toShippingAddressEntity with right values it should return ShippingAddressEntity with right values',
        () {
          final expectedResult = const AddressEntity(
            street: "fake-street",
            phone: "fake-phone",
            city: "fake-city",
            lat: "fake-lat",
            long: "fake-long",
            username: "fake-username",
            id: "fake-id",
          );

          final result = expectedResult.toShippingAddressEntity();

          expect(result.street, expectedResult.street);
          expect(result.phone, expectedResult.phone);
          expect(result.city, expectedResult.city);
          expect(result.lat, expectedResult.lat);
          expect(result.long, expectedResult.long);
        },
      );
    });

    group("test CashOrderMapper", () {
      test(
        'when call toEntity with null values it should return CashOrderEntity with null values',
        () async {
          final expectedResult = CashOrderResponse(message: null, order: null);

          final result = expectedResult.toEntity();

          expect(result.message, null);
        },
      );

      test(
        'when call toEntity with right values it should return CashOrderEntity with right values',
        () {
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
                OrderItemsDTO(
                  product: ProductDto(
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
                  price: 50,
                  quantity: 10,
                  id: "fake-id-2",
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

          final result = expectedResult.toEntity();

          expect(result.message, expectedResult.message);
        },
      );
    });

    group("test CreditOrderMapper", () {
      test(
        'when call toEntity with null values it should return CreditOrderEntity with null values',
        () async {
          final expectedResult = CreditOrderResponse(
            message: null,
            session: null,
          );

          final result = expectedResult.toEntity();

          expect(result.message, null);
          expect(result.url, null);
        },
      );

      test(
        'when call toEntity with right values it should return CreditOrderEntity with right values',
        () {
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
                address: null,
                name: null,
                phone: null,
                taxIds: null,
              ),
              invoiceCreation: InvoiceCreation(
                enabled: true,
                invoiceData: InvoiceData(
                  accountTaxIds: null,
                  customFields: null,
                  description: null,
                  footer: null,
                  issuer: null,
                  renderingOptions: null,
                ),
              ),
              paymentMethodConfigurationDetails:
                  PaymentMethodConfigurationDetails(
                    id: "pmcd_123",
                    parent: null,
                  ),
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

          final result = expectedResult.toEntity();

          expect(result.message, expectedResult.message);
          expect(result.url, expectedResult.session?.url);
        },
      );
    });
  });
}
