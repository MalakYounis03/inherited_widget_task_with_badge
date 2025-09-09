import 'package:flutter/material.dart';
import 'package:inherited_widget_task2/cart/model/cart_model.dart';
import 'package:inherited_widget_task2/products/model/products_model.dart';

class CartScope extends ValueNotifier<Map<String, CartItem>> {
  CartScope() : super({});

  void add(Product product) {
    final id = product.id;
    if (value.containsKey(id)) {
      value[id]!.quantity += 1;
    } else {
      value[id] = CartItem(product: product, quantity: 1);
    }
    notifyListeners();
  }

  /// زيادة العدد في شاشة السلة
  void increment(String productId) {
    final item = value[productId];
    if (item == null) return;
    item.quantity += 1;
    notifyListeners();
  }

  /// إنقاص العدد (ولو وصل 0 ينحذف من السلة)
  void decrement(String productId) {
    final item = value[productId];
    if (item == null) return;

    if (item.quantity > 1) {
      item.quantity -= 1;
    } else {
      value.remove(productId);
    }
    notifyListeners();
  }

  bool get isEmpty => value.isEmpty;

  /// عناصر السلة كـ List مرتبة (لو تحتاجها بالعرض)
  List<CartItem> get items => value.values.toList(growable: false);

  int get totalQuantity =>
      value.values.fold<int>(0, (sum, item) => sum + item.quantity);
}
