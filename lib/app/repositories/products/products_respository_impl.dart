import 'dart:developer';

import 'package:dart_week_app/app/core/rest_client/custon_dio.dart';
import 'package:dart_week_app/app/models/product_model.dart';
import 'package:dio/dio.dart';


import '../../core/exceptions/repository_exception.dart';
import './products_respository.dart';

class ProductsRespositoryImpl implements ProductsRespository {
  final CustonDio dio;
  ProductsRespositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get("/products");
      return result.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produto', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produto');
    }
  }
}
