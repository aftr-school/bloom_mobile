import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  final int price;
  final int qty;
  final String uom;

  const ProductTitle({
    Key? key,
    required this.title,
    required this.price,
    required this.qty,
    required this.uom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            children: [
              Text(
                'Rp$price',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Text('/kg'),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Qty: $qty $uom'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
