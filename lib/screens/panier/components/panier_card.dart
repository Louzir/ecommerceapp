import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/panier.dart';
import 'package:flutter_ecommerce_app/components/constants.dart';
import 'package:flutter_ecommerce_app/components/size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(widget.cart.product.images[0]),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.cart.product.title,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "${widget.cart.product.price} TND",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${widget.cart.numOfItems}",
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
