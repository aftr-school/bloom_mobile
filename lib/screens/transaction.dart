import 'package:flutter/material.dart';

import '../widgets/transaction_amounts.dart';
import '../widgets/transaction_card.dart';
import '../widgets/transaction_checkout.dart';
import '../widgets/transaction_switch.dart';

class Transaction extends StatefulWidget {
  static const String routName = '/transactions';

  const Transaction({Key? key}) : super(key: key);

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final int _amount = 500000;
  int _qty = 1;
  bool _isDelivery = false;

  int get _deliveryServices {
    if (_isDelivery) {
      return 20000;
    } else {
      return 0;
    }
  }

  String get _totalAmounts {
    return 'Rp${_deliveryServices + _qty * _amount}';
  }

  void _onSwitch(bool val) {
    setState(() {
      _isDelivery = val;
    });
  }

  void _onQtyChange(int val) {
    setState(() {
      if (val < 1) {
        _qty = 1;
      } else {
        _qty = val;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
      ),
      body: Listener(
        onPointerDown: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  TransactionCard(onQtyChange: _onQtyChange),
                  TransactionSwitch(
                    isDelivery: _isDelivery,
                    onSwitch: _onSwitch,
                  ),
                  TransactionAmounts(deliveryServices: _deliveryServices),
                ],
              ),
            ),
            TransactionCheckout(totalAmounts: _totalAmounts),
          ],
        ),
      ),
    );
  }
}
