import 'package:flutter/material.dart';
import 'package:inherited_widget_task2/cart/viewmodel/cart_provider.dart';
import 'package:inherited_widget_task2/cart/viewmodel/cart_view_model.dart';
import 'package:inherited_widget_task2/products/view/products_view.dart';

void main() {
  runApp(CartProvider(cart: CartScope(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductsView());
  }
}
