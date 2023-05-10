// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../models/product_model.dart';

class OrdenProductDto {
  final ProductModel product;
  final int amount;

  OrdenProductDto({
    required this.product,
    required this.amount,
  });

  double get totalPrice => amount * product.price;
}
