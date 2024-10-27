import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocks/authentication/authentication_bloc.dart';
import 'blocks/product/product_bloc.dart';
import 'repositories/authentication_repository.dart';
import 'repositories/product_repository.dart';
import 'screens/login_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/product_detail_screen.dart';
import 'blocks/product/product_event.dart';

import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inicializa los repositorios
    final authenticationRepository = AuthenticationRepository();
    final productRepository = ProductRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(authenticationRepository),
        ),
        BlocProvider(
          create: (context) => ProductBloc(productRepository)..add(ProductFetch()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // Define la pantalla inicial de la aplicación
        initialRoute: '/',
        routes: {
          '/' : (context) => LoginScreen(),
          '/products': (context) => ProductListScreen(),
          '/productDetails': (context) => ProductDetailScreen(
              product: ModalRoute.of(context)!.settings.arguments as Product),
        },
      ),
    );
  }
}

