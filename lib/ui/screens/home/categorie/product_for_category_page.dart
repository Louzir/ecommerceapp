import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Models/Response/response_products_home.dart';
import 'package:flutter_ecommerce_app/Service/product_services.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';

import '../detail_product_page/DetailsProductPage.dart';

class CategoryProductsPage extends StatefulWidget {
  final String uidCategory;
  final String category;

  const CategoryProductsPage(
      {super.key, required this.uidCategory, required this.category});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryProductsPageState createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  @override
  Widget build(BuildContext context) {
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
          backgroundColor: const Color(0xfff5f5f5),
          appBar: AppBar(
            title: TextFrave(
                text: widget.category,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: FutureBuilder<List<ListProducts>>(
            future:
                productServices.getProductsForCategories(widget.uidCategory),
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
                : Padding(
                    padding: const EdgeInsets.all(0),
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 90, top: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 25,
                                mainAxisSpacing: 20,
                                mainAxisExtent: 220),
                        itemCount: snapshot.data!.length,
                        // child: StaggeredDualView(
                        //     itemCount: snapshot.data!.length,
                        //     spacing: 5,
                        //     alturaElement: 0.15,
                        //     aspectRatio: 0.8,
                        itemBuilder: (context, i) => Card(
                              shadowColor: Colors.black26,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 10.0,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Colors.redAccent[100],
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => DetailsProductPage(
                                            product: snapshot.data![i]))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // ignore: avoid_unnecessary_containers
                                          Container(
                                            child: Hero(
                                                tag: snapshot
                                                    .data![i].uidProduct
                                                    .toString(),
                                                child: Image.network(
                                                  URLS.baseUrl +
                                                      snapshot.data![i].picture,
                                                  height: 120,
                                                  width: 130,
                                                )),
                                          ),
                                          const SizedBox(height: 10.0),
                                          TextFrave(
                                              text:
                                                  snapshot.data![i].nameProduct,
                                              fontWeight: FontWeight.w500),
                                          TextFrave(
                                              text:
                                                  '${snapshot.data![i].price} TND',
                                              fontSize: 16),
                                        ],
                                      ),
                                      Positioned(
                                          right: 0,
                                          child: snapshot.data![i].isFavorite ==
                                                  1
                                              ? InkWell(
                                                  onTap: () => productBloc.add(
                                                      OnAddOrDeleteProductFavoriteEvent(
                                                          uidProduct: snapshot
                                                              .data![i]
                                                              .uidProduct
                                                              .toString())),
                                                  child: const Icon(
                                                      Icons.favorite_rounded,
                                                      color: Colors.red),
                                                )
                                              : InkWell(
                                                  onTap: () => productBloc.add(
                                                      OnAddOrDeleteProductFavoriteEvent(
                                                          uidProduct: snapshot
                                                              .data![i]
                                                              .uidProduct
                                                              .toString())),
                                                  child: const Icon(Icons
                                                      .favorite_outline_rounded))),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
          )),
    );
  }
}
