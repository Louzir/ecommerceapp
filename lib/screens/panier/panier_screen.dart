import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/panier.dart';
import 'package:flutter_ecommerce_app/components/navigbar.dart';
import 'package:flutter_ecommerce_app/screens/panier/components/body.dart';
import 'components/check_out_card.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar builAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ), // icône à utiliser
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NavigBar()));
        },
      ),
      title: Column(
        children: [
          const Text(
            "Mon panier",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 6),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
