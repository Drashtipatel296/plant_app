import 'package:flutter/material.dart';
import 'package:plant_app/view/screens/cart.dart';
import 'package:plant_app/view/screens/home.dart';
import 'package:plant_app/view/screens/product.dart';
import 'package:plant_app/view/screens/splash.dart';

void main(){
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/home' : (context) => const HomeScreen(),
        '/product' : (context) => const ProductScreen(),
        '/cart' : (context) => const CartScreen(),
      },
    );
  }
}
