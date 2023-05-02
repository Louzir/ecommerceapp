import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/Models/Response/response_products_home.dart';
import 'package:flutter_ecommerce_app/Service/product_services.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/detail_product_page/DetailsProductPage.dart';

class ListProductsForHome extends StatelessWidget {
  const ListProductsForHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

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
            : GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 220),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) => Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailsProductPage(product: snapshot.data![i]),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Hero(
                                  tag: snapshot.data![i].uidProduct.toString(),
                                  child: Image.network(
                                      URLS.baseUrl + snapshot.data![i].picture,
                                      height: 113)),
                            ),
                            TextFrave(
                              text: snapshot.data![i].nameProduct,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: Color(
                                0xFF595959,
                              ),
                            ),
                            TextFrave(
                              text: ' ${snapshot.data![i].price} \TND',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(
                                0xFF222D61,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.redAccent),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsProductPage(
                                              product: snapshot.data![i],
                                            )),
                                  );
                                },
                                child: const Text(
                                  'J’achéte',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            right: 0,
                            child: snapshot.data![i].isFavorite == 1
                                ? InkWell(
                                    onTap: () => productBloc.add(
                                        OnAddOrDeleteProductFavoriteEvent(
                                            uidProduct: snapshot
                                                .data![i].uidProduct
                                                .toString())),
                                    child: const Icon(Icons.favorite_rounded,
                                        color: Colors.red),
                                  )
                                : InkWell(
                                    onTap: () => productBloc.add(
                                        OnAddOrDeleteProductFavoriteEvent(
                                            uidProduct: snapshot
                                                .data![i].uidProduct
                                                .toString())),
                                    child:
                                        Icon(Icons.favorite_outline_rounded))),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
