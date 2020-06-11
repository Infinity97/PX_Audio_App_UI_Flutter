import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class InitialProductsState extends ProductsState {
  @override
  List<Object> get props => [];
}
