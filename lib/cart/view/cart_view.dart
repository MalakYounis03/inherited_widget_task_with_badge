import 'package:flutter/material.dart';
import 'package:inherited_widget_task2/cart/viewmodel/cart_provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Cart')),

      body: ValueListenableBuilder(
        valueListenable: cart!,
        builder: (context, cartValue, child) {
          final items = cart.items;
          if (items.isEmpty) {
            return const Center(child: Text('Cart is empty'));
          }

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final item = items[index];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E4EA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.product.name,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.product.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    cart.increment(item.product.id),
                                icon: Icon(Icons.add),
                              ),
                              Text(' ${item.quantity} '),
                              IconButton(
                                onPressed: () =>
                                    cart.decrement(item.product.id),
                                icon: Icon(Icons.minimize),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
