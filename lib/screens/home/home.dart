import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home/profile_screen/profile_drawer.dart';
import 'package:flutter_ecommerce_app/screens/home/slider/slider.dart';
import 'components/categories.dart';
import 'components/product_card.dart';
import 'components/search.dart';
import 'components/sectiontitle.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => Home4State();
}

class Home4State extends State<Home> {
  int selectedIndex = 0;
  List imgList = [
    "Groupe2",
    "Groupe3",
    "Groupe4",
    "Groupe5",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer_profile(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                text: "Nom de boutique",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nOuvert',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                  TextSpan(
                    text: ' Jusqu’à 9:00 Pm',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(top: 14, right: 10),
                child: Icon(Icons.keyboard_arrow_down),
              ),
              onPressed: () {
                // add onPressed callback
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Search(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),

                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bonjour Charrada",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Nous vous proposons des recommandations",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/profil.png'),
                      ),
                    ],
                  ),
                  // add other widgets as needed
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10),
                child: Text(
                  "Catégories",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Categories(),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SectionTitle(
                  title: "Juste pour vous",
                  pressSeeAll: () {},
                ),
              ),
              const ProductSlider(),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10),
                child: Text(
                  "Product Name",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, left: 10),
                child: Text(
                  "25.00 TND",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, left: 10),
                child: Text(
                  "Lörem ipsum sorad Madeleine Engström. Du kan \nvara drabbad. Krofask nystartsjobb det vill säga.",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 15),
                ),
              ),
              GridView.builder(
                  padding: const EdgeInsets.only(right: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.width - 30 - 15) /
                            (2 * 290),
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: imgList.length,
                  itemBuilder: (_, i) {
                    if (i % 2 == 0) {
                      return ProductCard(imgList[i]);
                    }
                    return OverflowBox(
                      maxHeight: 290.0 + 120.0,
                      child: Container(
                        margin: const EdgeInsets.only(top: 55),
                        child: ProductCard(imgList[i]),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
