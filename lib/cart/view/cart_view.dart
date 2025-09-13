import 'package:flutter/material.dart';
import 'package:inherited_widget_task2/app_services/cart_provider.dart';
import 'package:inherited_widget_task2/cart/model/cart_model.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);
    final items = cart.items;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Cart')),

      body: items.isEmpty
          ? Center(child: Text('Cart is empty'))
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final item = items.values.toList()[index];
                return CartItemView(cartItem: item);
              },
            ),
    );
  }
}

class CartItemView extends StatefulWidget {
  final CartItem cartItem;
  const CartItemView({super.key, required this.cartItem});

  @override
  State<CartItemView> createState() => _CartItemViewState();
}

class _CartItemViewState extends State<CartItemView> {
  @override
  Widget build(BuildContext context) {
    final cart = CartProvider.of(context);
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
              widget.cartItem.product.name,
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
                    widget.cartItem.product.name,
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
                      onPressed: () {
                        setState(
                          () => cart.increment(widget.cartItem.product.id),
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
                    Text(' ${widget.cartItem.quantity} '),
                    IconButton(
                      onPressed: () {
                        setState(
                          () => cart.decrement(widget.cartItem.product.id),
                        );
                      },
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
  }
}
