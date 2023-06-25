import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/ui/screens/Home/home.dart';

import '../../../components/widgets.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

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
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    const SizedBox(height: 4),
                    BlocBuilder<ProductBloc, ProductState>(
                        // builder: (_, state) => TextFrave(text: '${state.products.length} items', fontSize: 19, color: Colors.black54 ),
                          builder: (_, state) {
                        if (state.products == null) {
                          return const TextFrave(
                              text: '0 items', fontSize: 19, color: Colors.black54);
                        }

                        return TextFrave(
                            text: '${state.products?.length} items',
                            fontSize: 19,
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




  // const Appbar({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return AppBar(
  //     centerTitle: true,
  //     backgroundColor: Colors.white,
  //     elevation: 0.5,
  //     leading: IconButton(
  //       icon: const Icon(
  //         Icons.arrow_back_ios,
  //         color: Colors.black,
  //       ), // icône à utiliser
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     ),
  //     title: Column(
  //       children: [
  //         const Text(
  //           "Mon panier",
  //           style: TextStyle(color: Colors.black),
  //         ),
  //         const SizedBox(height: 4),
  //         BlocBuilder<ProductBloc, ProductState>(
  //             builder: (_, state) => state.products != null
  //                 ? TextFrave(
  //                     text: '${state.products!.length} items',
  //                     fontSize: 15,
  //                     color: Colors.black54)
  //                 : const TextFrave(
  //                     text: '0 items', fontSize: 15, color: Colors.black54)),
  //         // Text(
  //         //   "${demoCarts.length} items",
  //         //   style: Theme.of(context).textTheme.bodySmall,
  //         // )
  //       ],
  //     ),
  //   );
  // }
  //}