// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

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
    } catch (e) {}
  }
}
