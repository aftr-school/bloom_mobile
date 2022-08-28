import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
  final Function onQtyChange;

  const TransactionCard({Key? key, required this.onQtyChange})
      : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final _qtyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _qtyController.text = '1';
  }

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
          SizedBox(
            width: 98,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  'https://images.unsplash.com/photo-1610663711502-35f870cfaea2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
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
                Text(
                  'Beras',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
                const Text('Bahar'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 78,
                      child: TextField(
                        onChanged: (_) => widget.onQtyChange(
                          _qtyController.text.isNotEmpty
                              ? int.parse(_qtyController.text)
                              : 1,
                        ),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        controller: _qtyController,
                        decoration: InputDecoration(
                          hintText: 'Qty',
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('/kg')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
