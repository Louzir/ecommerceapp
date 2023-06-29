// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/default_button.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';

import '../../../Helpers/helpers.dart';
import '../../components/enums.dart';
import '../../components/navigbar.dart';
import '../Home/home.dart';
import '../payement/information_de_livraison/infoscreen.dart';

class PanierScreen extends StatelessWidget {
  static String routeName = "/panier";

  const PanierScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.panier),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _ListProductsCard(),
          Positioned(
            bottom: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              height: 150,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -15),
                      blurRadius: 20,
                      color: Colors.grey.withOpacity(0.15),
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextFrave(
                            text: 'Total',
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                        BlocBuilder<ProductBloc, ProductState>(
                          builder: (context, state) => TextFrave(
                              text: '${state.total.toStringAsFixed(2)} TND',
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  SizedBox(
                    width: getProportionateScreenWidth(190),
                    child: DefaultButton(
                      text: "Checkout",
                      press: () {
                        //isnotEmpty
                        if (productBloc.product.isNotEmpty) {
                          Navigator.pushNamed(
                              context, Info_livraison.routeName);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ListProductsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return SafeArea(
      child: Column(
        children: [
          // const SizedBox(height: 15.0),
          _AppBarCart(),
          const SizedBox(height: 20.0),
          productBloc.product.isEmpty
              ? const WithoutProducts()
              : _DetailsProducts()
        ],
      ),
    );
  }
}

class _DetailsProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.products?.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                padding: const EdgeInsets.all(15.0),
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffF5F5F5)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: (state.products != null &&
                              state.products![i].image != null)
                          ? Image.network(
                               state.products![i].image)
                          : const Placeholder(),
                    ), // Or any other placeholder widget
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: state.products != null &&
                                        state.products!.length > i &&
                                        state.products![i] != null
                                    ? TextFrave(
                                        text: state.products![i].name,
                                        fontSize: 19,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : Container(),
                              ),
                              GestureDetector(
                                  onTap: () => productBloc
                                      .add(OnDeleteProductToCartEvent(i)),
                                  child: const Icon(Icons.close,
                                      color: Colors.red, size: 25))
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFrave(
                          text: state.products != null &&
                                  state.products!.length > i &&
                                  state.products![i] != null
                              ? '${state.products![i].price} TND'
                              : 'N/A',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: 230,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0))),
                                  child: const Icon(Icons.remove,
                                      color: Color(0xff0C6CF2)),
                                ),
                                onTap: () {
                                  if (state.products![i].amount > 1) {
                                    productBloc
                                        .add(OnSubtractQuantityProductEvent(i));
                                  }
                                },
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                color: Colors.white,
                                child: Center(
                                  child: TextFrave(
                                    text: state.products != null &&
                                            state.products!.length > i &&
                                            state.products![i] != null
                                        ? '${state.products![i].amount}'
                                        : 'N/A',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  productBloc
                                      .add(OnPlusQuantityProductEvent(i));
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0))),
                                  child: const Icon(Icons.add,
                                      color: Color(0xff0C6CF2)),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AppBarCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ), // icône à utiliser
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      routeSlide(page: const Home()), (_) => false),
                ),
                const SizedBox(width: 110.0),
                Column(
                  children: [
                    const TextFrave(
                        text: 'My Cart',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    const SizedBox(height: 2),
                    BlocBuilder<ProductBloc, ProductState>(
                        // builder: (_, state) => TextFrave(text: '${state.products.length} items', fontSize: 19, color: Colors.black54 ),
                        builder: (_, state) {
                      if (state.products == null) {
                        return const TextFrave(
                            text: '0 items',
                            fontSize: 14,
                            color: Colors.black54);
                      }

                      return TextFrave(
                          text: '${state.products?.length} items',
                          fontSize: 14,
                          color: Colors.black54);
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WithoutProducts extends StatelessWidget {
  const WithoutProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(420),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You have not any product yet! ",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: getProportionateScreenWidth(200),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(const BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => Navigator.pushNamed(context, Home.routeName),
                child: const Text('Shop Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






























// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
// import 'package:flutter_ecommerce_app/ui/components/default_button.dart';
// import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
// import 'package:flutter_ecommerce_app/ui/components/navigbar.dart';
// import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
// import 'package:flutter_ecommerce_app/ui/screens/panier/components/appbar.dart';
// import 'package:flutter_ecommerce_app/ui/screens/panier/components/panier_card.dart';
// import 'package:flutter_ecommerce_app/ui/screens/panier/components/without_product_cart.dart';
// import '../../components/enums.dart';
// import '../payement/information_de_livraison/infoscreen.dart';

// class PanierScreen extends StatelessWidget {
//   static String routeName = "/panier";

//   const PanierScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final productBloc = BlocProvider.of<ProductBloc>(context);

//     return Scaffold(
//       bottomNavigationBar: const NavigBar(selectedMenu: MenuState.panier),
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           _ListProductsCard(),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//               height: 150,
//               width: size.width,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(30.0),
//                       topRight: Radius.circular(30.0)),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey[300]!,
//                         blurRadius: 10,
//                         spreadRadius: 5)
//                   ]),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 15.0, right: 15.0, top: 10.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const TextFrave(
//                             text: 'Total',
//                             fontSize: 23,
//                             fontWeight: FontWeight.w500),
//                         BlocBuilder<ProductBloc, ProductState>(
//                           builder: (context, state) => TextFrave(
//                               text: '${state.total.toStringAsFixed(2)} TND',
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: const Color(0xff0C6CF2)),
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 18.0),
//                   SizedBox(
//                     width: getProportionateScreenWidth(190),
//                     child: DefaultButton(
//                       text: "Checkout",
//                       press: () {
//                         //isnotEmpty
//                         if (productBloc.product.isEmpty) {
//                           Navigator.pushNamed(
//                               context, Info_livraison.routeName);
//                         }
//                       },
//                     ),
//                   ),
//                   // DefaultButton(
//                   //   text: 'Checkout',
//                   //   press: () {
//                   //     if( productBloc.product.isNotEmpty ) {
//                   //       Navigator.push(context, routeSlide(page:const Info_livraison()));
//                   //     }
//                   //   },
//                   // ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class _ListProductsCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productBloc = BlocProvider.of<ProductBloc>(context);
//     return BlocProvider<ProductBloc>(
//       create: (context) => ProductBloc(),
//       child: SafeArea(
//         child: Column(
//           children: [
//             const SizedBox(height: 15.0),
//             const Appbar(),
//             const SizedBox(height: 20.0),
//             productBloc.product.isEmpty
//                 ? const WithoutProductsCart()
//                 : const DetailsProductsCart()
//           ],
//         ),
//       ),
//     );
//   }
// }



// // class PanierScreen extends StatefulWidget {
// //   static String routeName = "/panier";

// //   const PanierScreen({super.key});

// //   @override
// //   State<PanierScreen> createState() => _PanierScreenState();
// // }

// // class _PanierScreenState extends State<PanierScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     print("screen has been initi");

// //     final productBloc = BlocProvider.of<ProductBloc>(context);

// //     return BlocListener<ProductBloc, ProductState>(
// //       listener: (context, state) {
// //         if (state is LoadingProductState) {
// //           modalLoadingShort(context);
// //         } else if (state is FailureProductState) {
// //           Navigator.pop(context);
// //           errorMessageSnack(context, state.error);
// //         } else if (state is SuccessProductState) {
// //           Navigator.pop(context);
// //           setState(() {});
// //         }
// //       },
// //       child: Scaffold(
// //         bottomNavigationBar: const NavigBar(selectedMenu: MenuState.panier),
// //         backgroundColor: Colors.white,
// //         body: _ListProductsCard(product: productBloc.product),
// //         // body: Stack(
// //         //   children: [
// //         //     _ListProductsCard(product: productBloc.product),
// //         //     Positioned(
// //         //       top: 0,
// //         //       child: Container(
// //         //         padding: EdgeInsets.symmetric(
// //         //           vertical: getProportionateScreenWidth(15),
// //         //           horizontal: getProportionateScreenWidth(30),
// //         //         ),
// //         //         // height: 174,
// //         //         decoration: BoxDecoration(
// //         //           color: Colors.white,
// //         //           borderRadius: const BorderRadius.only(
// //         //             topLeft: Radius.circular(30),
// //         //             topRight: Radius.circular(30),
// //         //           ),
// //         //           boxShadow: [
// //         //             BoxShadow(
// //         //               offset: const Offset(0, -15),
// //         //               blurRadius: 20,
// //         //               color: const Color(0xFFDADADA).withOpacity(0.15),
// //         //             )
// //         //           ],
// //         //         ),
// //         //         child: SafeArea(
// //         //           child: Column(
// //         //             mainAxisSize: MainAxisSize.min,
// //         //             crossAxisAlignment: CrossAxisAlignment.start,
// //         //             children: [
// //         //               Row(
// //         //                 children: [
// //         //                   Container(
// //         //                     padding: const EdgeInsets.all(10),
// //         //                     height: getProportionateScreenWidth(40),
// //         //                     width: getProportionateScreenWidth(40),
// //         //                     decoration: BoxDecoration(
// //         //                       color: const Color(0xFFF5F6F9),
// //         //                       borderRadius: BorderRadius.circular(10),
// //         //                     ),
// //         //                     child: SvgPicture.asset("assets/icons/receipt.svg"),
// //         //                   ),
// //         //                   const Spacer(),
// //         //                   GestureDetector(
// //         //                     onTap: () => showModalBottomSheet(
// //         //                       backgroundColor: Colors.transparent,
// //         //                       isScrollControlled: true,
// //         //                       context: context,
// //         //                       builder: (context) {
// //         //                         return SizedBox(
// //         //                           height: getProportionateScreenWidth(800),
// //         //                           child: const CouponScreen(),
// //         //                         );
// //         //                       },
// //         //                     ),
// //         //                     child: const Text("Entrer le code coupon"),
// //         //                   ),
// //         //                   const SizedBox(width: 10),
// //         //                   IconButton(
// //         //                     icon: const Icon(
// //         //                       Icons.arrow_forward_ios,
// //         //                       color: Colors.black,
// //         //                       size: 14,
// //         //                     ),
// //         //                     onPressed: () {
// //         //                       showModalBottomSheet(
// //         //                         backgroundColor: Colors.transparent,
// //         //                         isScrollControlled: true,
// //         //                         context: context,
// //         //                         builder: (context) {
// //         //                           return SizedBox(
// //         //                             height: getProportionateScreenWidth(800),
// //         //                             child: const CouponScreen(),
// //         //                           );
// //         //                         },
// //         //                       );
// //         //                     }, // icône à utiliser
// //         //                   ),
// //         //                 ],
// //         //               ),
// //         //               SizedBox(height: getProportionateScreenHeight(20)),
// //         //               Row(
// //         //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         //                 children: [
// //         //                   BlocBuilder<ProductBloc, ProductState>(
// //         //                     builder: (context, state) {
// //         //                       return Text.rich(
// //         //                         TextSpan(
// //         //                           text: "Total:\n",
// //         //                           children: [
// //         //                             TextSpan(
// //         //                               text:
// //         //                                   '${state.total.toStringAsFixed(2)} TND',
// //         //                               style: const TextStyle(
// //         //                                 fontSize: 21,
// //         //                                 fontWeight: FontWeight.normal,
// //         //                                 color: Colors.black,
// //         //                               ),
// //         //                             ),
// //         //                           ],
// //         //                         ),
// //         //                       );
// //         //                     },
// //         //                   ),
// //         //                   SizedBox(
// //         //                     width: getProportionateScreenWidth(190),
// //         //                     child: DefaultButton(
// //         //                       text: "Cammander",
// //         //                       press: () {
// //         //                         if (productBloc.product.isNotEmpty) {
// //         //                           Navigator.pushNamed(
// //         //                               context, Info_livraison.routeName);
// //         //                         }
// //         //                       },
// //         //                     ),
// //         //                   ),
// //         //                 ],
// //         //               ),
// //         //             ],
// //         //           ),
// //         //         ),
// //         //       ),
// //         //     )
// //         //   ],
// //         // ),
// //       ),
// //     );
// //   }
// // }

// // class _ListProductsCard extends StatelessWidget {
// //   final List<ProductCart> product;
// //   _ListProductsCard({required this.product});
// //   @override
// //   Widget build(BuildContext context) {
// //     print('list product has been init');
// //     final productBloc = BlocProvider.of<ProductBloc>(context);
// //     print(product);

// //     return SafeArea(
// //       child: SingleChildScrollView(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             const SizedBox(height: 15.0),
// //             const Appbar(),
// //             const SizedBox(height: 20.0),
// //             product.isEmpty
// //                 ? const WithoutProductsCart()
// //                 : DetailsProductsCart(product: productBloc.product)
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
