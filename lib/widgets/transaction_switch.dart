import 'package:flutter/material.dart';

class TransactionSwitch extends StatelessWidget {
  final bool isDelivery;
  final Function onSwitch;

  const TransactionSwitch({
    Key? key,
    required this.isDelivery,
    required this.onSwitch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Text('Use our delivery services'),
          Switch.adaptive(
            value: isDelivery,
            onChanged: (value) => onSwitch(value),
          ),
        ],
      ),
    );
  }
}
