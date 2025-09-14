import 'package:equatable/equatable.dart';

class AddProductToCartRequestEntity extends Equatable {
  final String? product;
  final int? quantity;

  const AddProductToCartRequestEntity({this.product, this.quantity});


  @override
  List<Object?> get props => [product, quantity];
}
