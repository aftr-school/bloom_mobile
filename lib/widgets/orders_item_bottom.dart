import 'package:flutter/material.dart';

class OrdersItemBottom extends StatelessWidget {
  const OrdersItemBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 64,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                'https://asset.kompas.com/crops/Ipf_PHKX4eT-ks7f8xs0Dn3Lz6Q=/0x0:1000x667/750x500/data/photo/2021/05/05/6092338be58f7.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Kapulaga'),
              Text(
                '200kg',
                style: Theme.of(context).textTheme.subtitle2,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Total Amounts:'),
                      Text(
                        'Rp500.000',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message_rounded),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
