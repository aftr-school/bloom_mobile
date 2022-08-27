import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Beras kualitas super duper',
            style: Theme.of(context).textTheme.headline6,
          ),
          Row(
            children: [
              Text(
                'Rp50.000',
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
                child: const Text('Qty: 30kg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
