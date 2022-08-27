import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  final List<String> images;

  const ProductImages({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images
          .map(
            (img) => SizedBox(
              width: double.infinity,
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        aspectRatio: 1,
        viewportFraction: 1,
        enlargeCenterPage: false,
      ),
    );
  }
}
