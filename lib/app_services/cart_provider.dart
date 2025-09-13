import 'package:flutter/material.dart';
import 'package:inherited_widget_task2/cart/model/cart_model.dart';
import 'package:inherited_widget_task2/products/model/products_model.dart';

// ignore: must_be_immutable
class CartProvider extends InheritedWidget {
  CartProvider({super.key, required super.child});

  Map<String, CartItem> items = {};

  static CartProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartProvider>()!;
  }

  @override
  bool updateShouldNotify(CartProvider oldWidget) {
    return true;
  }

  void add(Product product) {
    final id = product.id;
    if (items.containsKey(id)) {
      items[id]!.quantity += 1;
    } else {
      items[id] = CartItem(product: product, quantity: 1);
    }
  }

  void increment(String productId) {
    final item = items[productId];
    if (item == null) return;
    item.quantity += 1;
  }

  void decrement(String productId) {
    final item = items[productId];
    if (item == null) return;

    if (item.quantity > 1) {
      item.quantity -= 1;
    } else {
      items.remove(productId);
    }
  }

  int totalquantity() {
    int total = 0;
    items.forEach((key, item) {
      total += item.quantity;
    });
    return total;
  }
}
