import 'package:another_carousel_pro/another_carousel_pro.dart';

import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Carousel(
          images: const [
            AssetImage("assets/chaussure.png"),
            AssetImage("assets/productsimages/Groupe3.png"),
            AssetImage("assets/chaussure.png"),
          ],
          borderRadius: true,
          radius: const Radius.circular(30),
          dotBgColor: Colors.transparent,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: const Duration(
            milliseconds: 800,
          ),
        ),
      ),
    );
  }
}
