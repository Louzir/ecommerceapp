import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/Service/product_services.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';


import '../../../../Models/Response/response_slide_products.dart';

class ProductSlider extends StatelessWidget {
  // final SlideProduct slide;
  const ProductSlider({
    Key? key,
    /*required this.slide*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15),
      child: SizedBox(
        height: 190,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<SlideProduct>>(
          future: productServices.listProductsHomeCarousel(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const ShimmerFrave()
                : CarouselSlider.builder(
                    itemCount: snapshot.data!.length,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              URLS.baseUrl + snapshot.data![index].image,
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
        // Positioned(
        //   bottom: 20,
        //   left: 20,
        //   child: Text(
        //     slide.nameCarousel,
        //     style: const TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: 20,
        //   right: 20,
        //   child: Text(
        //     'Text 2',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
