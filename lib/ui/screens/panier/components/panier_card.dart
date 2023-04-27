import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/product/product_bloc.dart';
import 'package:flutter_ecommerce_app/service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/themes/colors_frave.dart';


class DetailsProductsCart extends StatelessWidget {
  //   final List<ProductCart> product;
  // DetailsProductsCart({required this.product});
  const DetailsProductsCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) => state.products != null
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.products!.length,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20.0),
                        padding: const EdgeInsets.all(15.0),
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color(0xffF5F5F5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: TextFrave(
                                        text: state.products![i].name,
                                        fontSize: 19,
                                        overflow: TextOverflow.ellipsis)),
                                GestureDetector(
                                    onTap: () => productBloc
                                        .add(OnDeleteProductToCartEvent(i)),
                                    child: const Icon(Icons.close,
                                        color: Colors.red, size: 25))
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 90,
                                    width: 90,
                                    child: Image.network(URLS.baseUrl +
                                        state.products![i].image)),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10.0),
                                    TextFrave(
                                        text: '\$ ${state.products![i].price}',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    const SizedBox(height: 20.0),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .55,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10.0))),
                                              child: const Icon(Icons.remove,
                                                  color: ColorsFrave
                                                      .primaryColorFrave),
                                            ),
                                            onTap: () {
                                              if (state.products![i].amount >
                                                  1) {
                                                productBloc.add(
                                                    OnSubtractQuantityProductEvent(
                                                        i));
                                              }
                                            },
                                          ),
                                          Container(
                                            height: 35,
                                            width: 35,
                                            color: Colors.white,
                                            child: Center(
                                                child: TextFrave(
                                                    text:
                                                        '${state.products![i].amount}',
                                                    fontSize: 18)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              productBloc.add(
                                                  OnPlusQuantityProductEvent(
                                                      i));
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0))),
                                              child: const Icon(Icons.add,
                                                  color: ColorsFrave
                                                      .primaryColorFrave),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const ShimmerFrave()),
      ),
    );
  }
}











































// import 'package:flutter/material.dart';
// import 'package:flutter_ecommerce_app/ui/models/panier.dart';
// import 'package:flutter_ecommerce_app/ui/components/constants.dart';
// import 'package:flutter_ecommerce_app/ui/components/size_config.dart';

// class CartCard extends StatefulWidget {
//   const CartCard({
//     Key? key,
//     required this.cart,
//   }) : super(key: key);

//   final Cart cart;

//   @override
//   State<CartCard> createState() => _CartCardState();
// }

// class _CartCardState extends State<CartCard> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           SizedBox(
//             width: 88,
//             child: AspectRatio(
//               aspectRatio: 0.88,
//               child: Container(
//                 padding: EdgeInsets.all(getProportionateScreenWidth(10)),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF5F6F9),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Image.asset(widget.cart.product.images[0]),
//               ),
//             ),
//           ),
//           const SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.cart.product.title,
//                 style: const TextStyle(color: Colors.black, fontSize: 16),
//                 maxLines: 2,
//               ),
//               const SizedBox(height: 10),
//               Text.rich(
//                 TextSpan(
//                   text: "${widget.cart.product.price} TND",
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w600, color: kPrimaryColor),
//                   children: [
//                     TextSpan(
//                         text: " x${widget.cart.numOfItems}",
//                         style: Theme.of(context).textTheme.bodyLarge),
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
