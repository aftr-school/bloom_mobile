import 'package:flutter/material.dart';

class OrdersItemTop extends StatelessWidget {
  const OrdersItemTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sabar Tani'),
            Text(
              '28 agustus 2022',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Success',
            style: TextStyle(color: Colors.green),
          ),
        )
      ],
    );
  }
}
