import 'package:dart_week_app/app/models/product_model.dart';

abstract class ProductsRespository {
  Future<List<ProductModel>> findAllProducts(); 
}
