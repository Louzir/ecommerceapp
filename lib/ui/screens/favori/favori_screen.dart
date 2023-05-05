import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Models/Response/response_products_home.dart';
import 'package:flutter_ecommerce_app/Service/product_services.dart';
import 'package:flutter_ecommerce_app/ui/components/enums.dart';
import 'package:flutter_ecommerce_app/ui/components/navigbar.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter_ecommerce_app/ui/screens/favori/components/favori_body.dart';

import '../Home/home.dart';

class FavoritePage extends StatefulWidget {
  static String routeName = "/favoritePage";

  const FavoritePage({super.key});
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
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
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ), // icône à utiliser
            onPressed: () => Navigator.of(context)
                .pushAndRemoveUntil(routeSlide(page: Home()), (_) => false),
          ),
          title: const Text(
            "Favorites",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder<List<ListProducts>>(
                future: productServices.allFavoriteProducts(),
                builder: (context, snapshot) => !snapshot.hasData
                    ? const Column(
                        children: [
                          ShimmerFrave(),
                          SizedBox(height: 10.0),
                          ShimmerFrave(),
                          SizedBox(height: 10.0),
                          ShimmerFrave(),
                        ],
                      )
                    : ListFavoriteProduct(products: snapshot.data!)),
            Positioned(
              bottom: 0,
              child: SizedBox(
                  width: size.width,
                  child: const Align(
                    child: NavigBar(selectedMenu: MenuState.favorites),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
