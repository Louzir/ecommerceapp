import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Models/Response/response_products_home.dart';
import 'package:flutter_ecommerce_app/Service/product_services.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter_ecommerce_app/ui/screens/favori/components/list_favorite.dart';

class Bodyfavori extends StatefulWidget {
  @override
  State<Bodyfavori> createState() => _BodyfavoriState();
}

class _BodyfavoriState extends State<Bodyfavori> {
  @override
  Widget build(BuildContext context) {
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
                  : ListFavoriteProduct(products: snapshot.data!),
            ),
          ],
        ),
      ),
    );
  }
}
