// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dart_week_app/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  // final String? errorMensage;

  const HomeState({
    required this.status,
    required this.products,
    // this.errorMensage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [];
  // errorMensage = null;

  @override
  List<Object?> get props => [
        status, products, //errorMensage,
      ];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMensage,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      // errorMensage: errorMensage ?? this.errorMensage,
    );
  }
}
