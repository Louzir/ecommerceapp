// ignore_for_file: annotate_overrides, overridden_fields

part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  final List<ProductCart>? products;
  final double total;
  final int amount;
  final double delivery;
  final double insurance;
  final String? pathImage;

  const ProductState(
      {this.products,
      this.total = 00.0,
      this.amount = 0,
      this.delivery = 7.0,
      this.insurance = 10.0,
      this.pathImage});
}

class ProductInitial extends ProductState {
  ProductInitial() : super(products: [], total: 00.0, amount: 0);
}

class LoadingProductState extends ProductState {}

class SuccessProductState extends ProductState {}

class FailureProductState extends ProductState {
  final String error;

  const FailureProductState(this.error);
}

class SetAddProductToCartState extends ProductState {
  final List<ProductCart> products;
  final double total;
  final int amount;

  const SetAddProductToCartState(
      {required this.products, required this.total, required this.amount})
      : super(products: products, total: total, amount: amount);
}

class SetImageForProductState extends ProductState {
  final String path;

  const SetImageForProductState(this.path) : super(pathImage: path);
}
