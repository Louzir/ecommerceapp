import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rate extends StatefulWidget {
  const Rate({super.key});

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              RatingBar.builder(
                unratedColor: const Color.fromARGB(255, 223, 221, 221),
                itemSize: 28,
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
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
                    unratedColor: const Color.fromARGB(255, 223, 221, 221),
                    itemSize: 20,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4),
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "air max are always very comfortable fit, clean and\n just perfect in every way. just the box was too\n small and scrunched the sneakers up a little bit,\n not sure if the box was always this small but the\n 90s are and will always be one of my favorites.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'December 10, 2016',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
