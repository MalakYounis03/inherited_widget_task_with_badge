import 'package:flutter/material.dart';
import 'package:inherited_widget_task2/cart/viewmodel/cart_view_model.dart';

class CartProvider extends InheritedWidget {
  final CartScope cart;

  const CartProvider({super.key, required this.cart, required super.child});

  static CartScope? of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CartProvider>();
    assert(provider != null, 'No CartProvider found in context');
    return provider!.cart;
  }

  @override
  bool updateShouldNotify(CartProvider oldWidget) {
    return cart != oldWidget.cart;
  }
}
