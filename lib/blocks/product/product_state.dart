import 'package:equatable/equatable.dart';
import 'package:prueba_flutter/models/product.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;
  ProductSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductFailure extends ProductState {
  final String error;
  ProductFailure(this.error);

  @override
  List<Object?> get props => [error];
}
