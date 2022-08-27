import 'package:flutter/material.dart';

class TransactionAmounts extends StatelessWidget {
  final int deliveryServices;

  const TransactionAmounts({
    Key? key,
    required this.deliveryServices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [Text('Item Amount:'), Text('Delivery Services:')],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Rp500.000'),
              Text('Rp${deliveryServices.toString()}'),
            ],
          )
        ],
      ),
    );
  }
}
