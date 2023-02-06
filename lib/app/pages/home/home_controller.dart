import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dart_week_app/app/pages/home/home_state.dart';
import 'package:dart_week_app/app/repositories/products/products_respository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRespository _productsRespository;

  HomeController(
    this._productsRespository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loaded));
    try {
      final products = await _productsRespository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } on Exception catch (e, s) {
      log('Erro ao buscar produto', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMensage: 'Erro ao buscar produto'));
    }
  }
}
