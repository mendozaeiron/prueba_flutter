import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_flutter/screens/product_detail_screen.dart';
import '../blocks/product/product_bloc.dart';
import '../blocks/product/product_state.dart';

/// `ProductListScreen` muestra una lista de productos.

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Productos')), // Título de la pantalla
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            // Muestra un indicador de carga mientras se obtienen los productos
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductSuccess) {
            // Muestra la lista de productos cuando la carga es exitosa
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  leading: Image.network(product.image), // Imagen del producto
                  title: Text(product.title), // Nombre del producto
                  subtitle: Text('\$${product.price}'), // Precio del producto
                  onTap: () {
                    // Navega a la pantalla de detalles del producto seleccionado
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailScreen(product: product),
    ),
  );
},
                );
              },
            );
          } else if (state is ProductFailure) {
            // Muestra un mensaje de error si ocurre un problema al cargar productos
            return Center(child: Text(state.error));
          } else {
            return Container(); // Contenedor vacío para cualquier otro caso
          }
        },
      ),
    );
  }
}
