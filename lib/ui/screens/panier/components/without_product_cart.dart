import 'package:flutter_ecommerce_app/Bloc/product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/ui/screens/Home/home.dart';
import 'package:flutter_ecommerce_app/ui/themes/colors_frave.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithoutProductsCart extends StatelessWidget {
  const WithoutProductsCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("You have not any product yet "),
    );

    // return BlocBuilder<ProductBloc, ProductState>(
    //   builder: (_, state)
    //     => state.products != null
    //     ? state.products!.isNotEmpty
    //       ? SizedBox(
    //           height: 290,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //             Icon(Icons.shopping_bag_outlined, size: 90, color: ColorsFrave.primaryColorFrave.withOpacity(.7)),
    //             const SizedBox(height: 20),
    //             const TextFrave(text: 'There is a cart to fill!', fontSize: 20, fontWeight: FontWeight.bold),
    //             const SizedBox(height: 20),
    //             const TextFrave(text: 'Currently do not have ', fontSize: 16),
    //             const SizedBox(height: 5),
    //             const TextFrave(text: 'any products in your shopping cart', fontSize: 16),
    //             const SizedBox(height: 40),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //               child: TextButton(
    //                 style:ButtonStyle(
    //                   side: MaterialStateProperty.all( const BorderSide(color: Colors.blue) ),
    //                   padding: MaterialStateProperty.all( const EdgeInsets.symmetric(horizontal: 40, vertical: 10))
    //                 ),
    //                 child: const TextFrave(text: 'Go Products', fontSize: 19 ),
    //                 onPressed: () => Navigator.of(context).pushAndRemoveUntil(routeSlide(page: const Home()), (_) => false),
    //               ),
    //             )
    //           ],
    //         )
    //       )
    //       : const SizedBox()
    //   : const ShimmerFrave()
    // );
  }
}
