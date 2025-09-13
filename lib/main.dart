import 'package:flutter/material.dart';
import 'package:inherited_widget_task2/app_services/cart_provider.dart';

import 'package:inherited_widget_task2/products/view/products_view.dart';

void main() {
  runApp(CartProvider(child: MaterialApp(home: ProductsView())));
}
