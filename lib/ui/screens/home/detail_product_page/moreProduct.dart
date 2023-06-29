// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_app/Models/Response/response_products_home.dart';
import 'package:flutter_ecommerce_app/Service/product_services.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/DetailsProductPage.dart';

class MoreProduct extends StatelessWidget {
  const MoreProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListProducts>>(
      future: productServices.listProductsHome(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Column(
                children: [
                  ShimmerFrave(),
                  SizedBox(height: 10.0),
                  ShimmerFrave(),
                  SizedBox(height: 10.0),
                  ShimmerFrave(),
                ],
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(snapshot.data!.length, (i) {
                    final product = snapshot.data![i];
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailsProductPage(
                                    product: snapshot.data![i]),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: "tag${product.uidProduct}",
                                child: Image.network(
                                   product.picture,
                                  height: 113,
                                ),
                              ),
                              TextFrave(
                                text: product.nameProduct,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: const Color(0xFF595959),
                              ),
                              TextFrave(
                                text: ' ${product.price} TND',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF222D61),
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              // const Padding(
                              //   padding: EdgeInsets.only(left: 35),
                              //   child: Row(
                              //     children: [
                              //       Text(
                              //         '534 TND',
                              //         style: TextStyle(
                              //             fontSize: 12,
                              //             decoration:
                              //                 TextDecoration.lineThrough,
                              //             decorationColor: Colors.grey,
                              //             decorationThickness: 2.0,
                              //             fontWeight: FontWeight.w600,
                              //             color: Colors.black54,
                              //             fontFamily: 'Poppins'),
                              //       ),
                              //       SizedBox(
                              //         width: 20,
                              //       ),
                              //       Text(
                              //         '24% Off',
                              //         style: TextStyle(
                              //             fontSize: 11,
                              //             fontWeight: FontWeight.w600,
                              //             color: Colors.black54,
                              //             fontFamily: 'Poppins'),
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
      },
    );
  }
}
