// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/components/seemore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../components/navigbar.dart';
import '../../../components/enums.dart';
import 'myappbar.dart';

class ProductScreen extends StatefulWidget {
  String img;
  ProductScreen(this.img, {super.key});
  static String routeName = "/product_screen";
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController textController = TextEditingController();
  bool isFavorite = false;
  int selectedNumber = 0;
  int selectedColor = -1;
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  // ignore: non_constant_identifier_names
  List<Color> Clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.orange,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.home),
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 224, 224),
                image: DecorationImage(
                  image: AssetImage("assets/productsimages/${widget.img}.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.img,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: isFavorite ? Colors.red : Colors.grey,
                            ),
                            onPressed: toggleFavorite,
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "350.00 TND",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "choisir Taille",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 26; i < 45; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedNumber = i;
                                });
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: selectedNumber == i
                                        ? Colors.blue
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  i.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Select Color",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = i;
                                });
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Clrs[i],
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: selectedColor == i
                                        ? Colors.black
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Specification",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SingleChildScrollView(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Shown: ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              "Laser Blue/Anthracite/Watermelon",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SingleChildScrollView(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Style: ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              "CD0113-40",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "The Nike Air Max 270 React ENG combines a\n full-length React foam midsole with a 270\n Max Air unit for unrivaled comfort and a\n striking visual experience.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SeeMore(
                      title: "Review Product",
                      pressSeeAll: () {},
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          RatingBar.builder(
                            unratedColor:
                                const Color.fromARGB(255, 223, 221, 221),
                            itemSize: 28,
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4),
                            onRatingUpdate: (rating) {},
                            itemBuilder: (context, _) =>
                                const Icon(Icons.star, color: Colors.amber),
                          ),
                          const Text(
                            '4 ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                                fontFamily: 'Poppins'),
                          ),
                          const Text(
                            '(6 Review)',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[300],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/chaussure.png",
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Motez',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  fontFamily: 'Poppins'),
                            ),
                            RatingBar.builder(
                              unratedColor:
                                  const Color.fromARGB(255, 223, 221, 221),
                              itemSize: 20,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              onRatingUpdate: (rating) {},
                              itemBuilder: (context, _) =>
                                  const Icon(Icons.star, color: Colors.amber),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "air max are always very comfortable fit, clean and\n just perfect in every way. just the box was too\n small and scrunched the sneakers up a little bit,\n not sure if the box was always this small but the\n 90s are and will always be one of my favorites.",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'December 10, 2016',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Vous pouvez aussi aimez',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/chaussure1.png'),
                                const Text(
                                  'FS - Nike Air Max 270 \nReact...',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                      fontFamily: 'Poppins'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  '299 TND',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepPurple,
                                      fontFamily: 'Poppins'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      '534 TND',
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.grey,
                                          decorationThickness: 2.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontFamily: 'Poppins'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '24% Off',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/chaussure2.png'),
                                const Text(
                                  'FS - QUILTED MAXI \nCROS...',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                      fontFamily: 'Poppins'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  '299 TND',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepPurple,
                                      fontFamily: 'Poppins'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      '534 TND',
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.grey,
                                          decorationThickness: 2.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontFamily: 'Poppins'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '24% Off',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black54,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        ),
      ),
    );
  }
}
