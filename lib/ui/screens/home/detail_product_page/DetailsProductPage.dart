// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Models/product.dart';
import 'package:flutter_ecommerce_app/Models/Response/response_products_home.dart';
import 'package:flutter_ecommerce_app/ui/components/cover_product.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/color.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/moreProduct.dart';

import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/nameproduct.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/rating.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/seemore.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/taille.dart';
import 'package:flutter_ecommerce_app/ui/themes/colors_frave.dart';

import '../../../components/navigbar.dart';
import '../../../components/enums.dart';
import 'myappbar.dart';

class DetailsProductPage extends StatefulWidget {
  final ListProducts product;
  const DetailsProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  static String routeName = "/product_screen";
  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    final size = MediaQuery.of(context).size;
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is LoadingProductState) {
          modalLoadingShort(context);
        } else if (state is FailureProductState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SuccessProductState) {
          Navigator.pop(context);
          setState(() {});
        } else if (state is SetAddProductToCartState) {
          modalSuccess(context, 'Product Added',
              onPressed: () => Navigator.pop(context));
        }
      },
      child: Scaffold(
        bottomNavigationBar: const NavigBar(selectedMenu: MenuState.home),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  MyAppBar(
                    nameProduct: widget.product.nameProduct,
                    uidProduct: widget.product.uidProduct.toString(),
                  ),
                  const SizedBox(height: 20.0),
                  CoverProduct(
                      uidProduct: widget.product.uidProduct.toString(),
                      imageProduct: widget.product.picture),
                  const SizedBox(height: 15.0),
                  NameProduct(
                      nameProduct: widget.product.nameProduct,
                      uidProduct: widget.product.uidProduct.toString(),
                      isFavorite: widget.product.isFavorite,
                      price: widget.product.price),
                  const SizedBox(height: 15),
                  const TailleProduct(),
                  const SizedBox(height: 15.0),
                  const SelectColor(),
                  const SizedBox(height: 15.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'Specification',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(
                          0xFF595959,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      widget.product.description,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SeeMore(
                      title: "Review Product",
                      pressSeeAll: () {},
                    ),
                  ),
                  const Rate(),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Vous pouvez aussi aimez',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const MoreProduct(),
                  const SizedBox(
                    height: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200]!,
                                blurRadius: 15,
                                spreadRadius: 15)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 55,
                            width: size.width * .45,
                            child: TextFrave(
                                text: '\$ ${widget.product.price}',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(width: 15.0),
                          Container(
                            height: 55,
                            width: size.width * .45,
                            decoration: BoxDecoration(
                                color: ColorsFrave.primaryColorFrave,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0))),
                              child: const TextFrave(
                                  text: 'Add to cart',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              onPressed: () {
                                final productSelect = ProductCart(
                                    uidProduct:
                                        widget.product.uidProduct.toString(),
                                    image: widget.product.picture,
                                    name: widget.product.nameProduct,
                                    price: widget.product.price.toDouble(),
                                    amount: 1);

                                productBloc.add(
                                    OnAddProductToCartEvent(productSelect));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],

                //
                //
                //           SingleChildScrollView(
                //             scrollDirection: Axis.horizontal,
                //             child: Row(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 18, right: 18),
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Image.asset('assets/chaussure1.png'),
                //                       const Text(
                //                         'FS - Nike Air Max 270 \nReact...',
                //                         style: TextStyle(
                //                             fontSize: 15,
                //                             fontWeight: FontWeight.w600,
                //                             color: Colors.black54,
                //                             fontFamily: 'Poppins'),
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       const Text(
                //                         '299 TND',
                //                         style: TextStyle(
                //                             fontSize: 15,
                //                             fontWeight: FontWeight.w600,
                //                             color: Colors.deepPurple,
                //                             fontFamily: 'Poppins'),
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       const Row(
                //                         children: [
                //                           Text(
                //                             '534 TND',
                //                             style: TextStyle(
                //                                 fontSize: 15,
                //                                 decoration:
                //                                     TextDecoration.lineThrough,
                //                                 decorationColor: Colors.grey,
                //                                 decorationThickness: 2.0,
                //                                 fontWeight: FontWeight.w600,
                //                                 color: Colors.black54,
                //                                 fontFamily: 'Poppins'),
                //                           ),
                //                           SizedBox(
                //                             width: 20,
                //                           ),
                //                           Text(
                //                             '24% Off',
                //                             style: TextStyle(
                //                                 fontSize: 15,
                //                                 fontWeight: FontWeight.w600,
                //                                 color: Colors.black54,
                //                                 fontFamily: 'Poppins'),
                //                           ),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 30, right: 30),
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Image.asset('assets/chaussure2.png'),
                //                       const Text(
                //                         'FS - QUILTED MAXI \nCROS...',
                //                         style: TextStyle(
                //                             fontSize: 15,
                //                             fontWeight: FontWeight.w600,
                //                             color: Colors.black54,
                //                             fontFamily: 'Poppins'),
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       const Text(
                //                         '299 TND',
                //                         style: TextStyle(
                //                             fontSize: 15,
                //                             fontWeight: FontWeight.w600,
                //                             color: Colors.deepPurple,
                //                             fontFamily: 'Poppins'),
                //                       ),
                //                       const SizedBox(
                //                         height: 20,
                //                       ),
                //                       const Row(
                //                         children: [
                //                           Text(
                //                             '534 TND',
                //                             style: TextStyle(
                //                                 fontSize: 15,
                //                                 decoration:
                //                                     TextDecoration.lineThrough,
                //                                 decorationColor: Colors.grey,
                //                                 decorationThickness: 2.0,
                //                                 fontWeight: FontWeight.w600,
                //                                 color: Colors.black54,
                //                                 fontFamily: 'Poppins'),
                //                           ),
                //                           SizedBox(
                //                             width: 20,
                //                           ),
                //                           Text(
                //                             '24% Off',
                //                             style: TextStyle(
                //                                 fontSize: 15,
                //                                 fontWeight: FontWeight.w600,
                //                                 color: Colors.black54,
                //                                 fontFamily: 'Poppins'),
                //                           ),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ]),
                //   ),
                //   const SizedBox(
                //     height: 50,
                //   ),
                // ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
