import 'package:bloom_mobile/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_buttons.dart';
import '../widgets/product_images.dart';

class ProductDetail extends StatelessWidget {
  static const String routeName = '/product-detail';

  ProductDetail({Key? key}) : super(key: key);

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    print(args['productFarmer']['price']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const ProductImages(
                  images: [
                    'https://images.unsplash.com/photo-1613758235256-43a7bdc21d82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                    'https://images.unsplash.com/photo-1610663711502-35f870cfaea2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                  ],
                ),
                ProductTitle(
                  title: args['name'],
                  price: args['productFarmer']['price'],
                  qty: args['productFarmer']['quantity'],
                  uom: args['uom'],
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Text(
                    args['description'] ?? 'No Description',
                  ),
                )
              ],
            ),
          ),
          const ProductButtons()
        ],
      ),
    );
  }
}
