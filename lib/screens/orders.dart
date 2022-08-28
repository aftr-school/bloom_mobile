import 'package:flutter/material.dart';

import '../widgets/orders_item.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const OrdersItem(),
      itemCount: 10,
    );
  }
}
