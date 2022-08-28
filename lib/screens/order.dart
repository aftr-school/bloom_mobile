import 'package:flutter/material.dart';

import '../widgets/order_card.dart';
import '../widgets/order_total_amounts.dart';
import '../widgets/transaction_amounts.dart';

class Order extends StatelessWidget {
  static const String routeName = '/order';

  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: ListView(children: const [
        OrderCard(qty: 3),
        TransactionAmounts(deliveryServices: 20000),
        OrderTotalAmounts(
          totalAmounts: 5020000,
        )
      ]),
    );
  }
}
