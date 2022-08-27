import 'package:bloom_mobile/widgets/product_buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/product_images.dart';
import '../widgets/product_title.dart';

class ProductDetail extends StatelessWidget {
  static const String routeName = '/product-detail';

  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const ProductTitle(),
                Container(
                  margin: const EdgeInsets.all(16),
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id nibh tortor id aliquet lectus proin nibh nisl. Scelerisque felis imperdiet proin fermentum. Non diam phasellus vestibulum lorem sed. Mi sit amet mauris commodo. Mauris augue neque gravida in fermentum et sollicitudin ac orci. Pulvinar pellentesque habitant morbi tristique senectus. Massa eget egestas purus viverra. Justo donec enim diam vulputate ut pharetra sit amet aliquam. Sed nisi lacus sed viverra tellus. Ipsum consequat nisl vel pretium lectus quam. Turpis massa tincidunt dui ut ornare. Scelerisque varius morbi enim nunc faucibus a. Ullamcorper a lacus vestibulum sed arcu non. Nisl nisi scelerisque eu ultrices vitae auctor eu. Hendrerit dolor magna eget est lorem ipsum dolor sit amet. Tortor pretium viverra suspendisse potenti. Nisi vitae suscipit tellus mauris a diam. Morbi tristique senectus et netus et malesuada fames. Maecenas volutpat blandit aliquam etiam erat.',
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
