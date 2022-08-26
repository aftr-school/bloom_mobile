import 'package:flutter/material.dart';

import 'orders_item_bottom.dart';
import 'orders_item_top.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          OrdersItemTop(),
          Divider(),
          OrdersItemBottom(),
        ],
      ),
    );
  }
}
