// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';

class CoverProduct extends StatelessWidget {

  final String imageProduct;
  final String uidProduct;

  const CoverProduct({super.key, required this.uidProduct, required this.imageProduct});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '$uidProduct',
      child: SizedBox(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Image.network( imageProduct),
      ),
    );
  }
}