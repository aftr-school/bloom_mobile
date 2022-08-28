import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/order.dart';

class TransactionCheckout extends StatelessWidget {
  final String totalAmounts;

  const TransactionCheckout({Key? key, required this.totalAmounts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amounts:',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                totalAmounts,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(Order.routeName),
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
                primary: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
