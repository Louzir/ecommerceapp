import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/ui/components/default_button.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/components/navigbar.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/components/appbar.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/components/coupon_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/components/panier_card.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/components/without_product_cart.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Models/product.dart';
import '../../components/enums.dart';
import '../payement/information_de_livraison/infoscreen.dart';

class PanierScreen extends StatefulWidget {
  static String routeName = "/panier";

  const PanierScreen({super.key});

  @override
  State<PanierScreen> createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  @override
  Widget build(BuildContext context) {
    print("screen has been initi");

    final productBloc = BlocProvider.of<ProductBloc>(context);

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
        }
      },
      child: Scaffold(
        bottomNavigationBar: const NavigBar(selectedMenu: MenuState.panier),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _ListProductsCard(product: productBloc.product),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(15),
                  horizontal: getProportionateScreenWidth(30),
                ),
                // height: 174,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -15),
                      blurRadius: 20,
                      color: const Color(0xFFDADADA).withOpacity(0.15),
                    )
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: getProportionateScreenWidth(40),
                            width: getProportionateScreenWidth(40),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F6F9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset("assets/icons/receipt.svg"),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: getProportionateScreenWidth(800),
                                  child: const CouponScreen(),
                                );
                              },
                            ),
                            child: const Text("Entrer le code coupon"),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 14,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: getProportionateScreenWidth(800),
                                    child: const CouponScreen(),
                                  );
                                },
                              );
                            }, // icône à utiliser
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, state) {
                              return Text.rich(
                                TextSpan(
                                  text: "Total:\n",
                                  children: [
                                    TextSpan(
                                      text:
                                          '${state.total.toStringAsFixed(2)} TND',
                                      style: const TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(190),
                            child: DefaultButton(
                              text: "Cammander",
                              press: () {
                                if (productBloc.product.isNotEmpty) {
                                  Navigator.pushNamed(
                                      context, Info_livraison.routeName);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListProductsCard extends StatelessWidget {
  final List<ProductCart> product;
  _ListProductsCard({required this.product});
  @override
  Widget build(BuildContext context) {
    print('list product has been init');
    // final productBloc = BlocProvider.of<ProductBloc>(context);
    print(product);

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 15.0),
          const Appbar(),
          const SizedBox(height: 20.0),
          product.isEmpty
              ? const WithoutProductsCart()
              : const DetailsProductsCart()
        ],
      ),
    );
  }
}
