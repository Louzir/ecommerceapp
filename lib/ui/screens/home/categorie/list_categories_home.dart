import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Models/Response/response_categories_home.dart';
import 'package:flutter_ecommerce_app/Service/product_services.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/categorie/product_for_category_page.dart';

import 'package:flutter_svg/svg.dart';

import '../../../components/shimmer_frave.dart';

class ListCategoriesHome extends StatelessWidget {
  const ListCategoriesHome({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<Categories>>(
          future: productServices.listCategoriesHome(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const ShimmerFrave()
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              routeSlide(
                                  page: CategoryProductsPage(
                                      uidCategory: snapshot
                                          .data![index].uidCategory
                                          .toString(),
                                      category:
                                          snapshot.data![index].category)));
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          side: const BorderSide(color: Colors.black54),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: SvgPicture.network(
                                  URLS.baseUrl + snapshot.data![index].picture,
                                  height: 120),
                            ),
                            TextFrave(
                                text: snapshot.data![index].category,
                                fontSize: 17,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black54),
                          ],
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
