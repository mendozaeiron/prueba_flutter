import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_flutter/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

/// `ProductBloc` maneja el estado de la lista de productos.
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    // Usar el método 'on' para manejar el evento de carga de productos
    on<ProductFetch>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await productRepository.fetchProducts();
        emit(ProductSuccess(products));
      } catch (error) {
        emit(ProductFailure('Error al cargar productos'));
      }
    });
  }
}

