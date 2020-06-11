import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  @override
  ProductsState get initialState => InitialProductsState();

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
