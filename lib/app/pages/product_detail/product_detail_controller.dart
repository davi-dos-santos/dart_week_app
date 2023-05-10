import 'package:bloc/bloc.dart';

class ProductDetailController extends Cubit<int> {
  late final bool _hasOrden;

  ProductDetailController() : super(1);

  void initial(int amount, bool hasOrden) {
    _hasOrden = hasOrden;
    emit(amount);
  }

  void increment() => emit(state + 1);
  void decrement() {
    if (state > (_hasOrden ? 0 : 1) ) {
      emit(state - 1);
    }
  }
}
