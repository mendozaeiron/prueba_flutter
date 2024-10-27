import 'package:flutter/material.dart';
import '../models/product.dart';

/// `ProductDetailScreen` muestra los detalles de un producto específico.
class ProductDetailScreen extends StatelessWidget {
  final Product product;

// Constructor que recibe un `product` para mostrar sus detalles
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)), // Título de la pantalla con el nombre del producto
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenedor con tamaño fijo para mantener la imagen responsiva
            Center(
              child: Container(
                width: 200, // Ajusta el ancho promedio de la imagen
                height: 200, // Ajusta el alto promedio de la imagen
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // Sombra para la imagen
                    ),
                  ],
                ),
                // Imagen con ajuste de boxFit y dimensiones limitadas
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover, // Ajusta la imagen para llenar el contenedor de manera proporcional
                    width: 200,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      // Muestra un widget alternativo en caso de error al cargar la imagen
                      return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(product.title, style: const TextStyle(fontSize: 24)), // Nombre del producto
            const SizedBox(height: 16),
            Text(product.description), // Descripción del producto
            const SizedBox(height: 16),
            Text('\$${product.price}', style: const TextStyle(fontSize: 24)), // Precio del producto
            // Muestra la calificación y el conteo de calificaciones
            Text('Calificación: ${product.ratingRate} / 5', style: const TextStyle(fontSize: 18)), // Calificación del producto
            const SizedBox(height: 8),
            Text('Número de valoraciones: ${product.ratingCount}', style: const TextStyle(fontSize: 18)), // Conteo de valoraciones
          ],
        ),
      ),
    );
  }
}


