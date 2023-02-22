import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/paiement_reussi.dart';
import 'package:flutter_ecommerce_app/screens/panier/components/coupon_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ecommerce_app/components/default_button.dart';
import 'package:flutter_ecommerce_app/components/size_config.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                const Text("Entrer le code coupon"),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 14,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: getProportionateScreenWidth(800),
                          child: const CouponScreen(),
                        );
                      },
                    );
                  }, // icône à utiliser
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "337.15 TND",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Cammander",
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentSuccessPage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
