import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/navigbar.dart';
import 'package:flutter_ecommerce_app/ui/components/enums.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/information_de_livraison/components/body.dart';

// ignore: camel_case_types
class Info_livraison extends StatefulWidget {
  const Info_livraison({super.key});
  static String routeName = "/info_de_livraison";
  @override
  State<Info_livraison> createState() => _Info_livraisonState();
}

// ignore: camel_case_types
class _Info_livraisonState extends State<Info_livraison> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body: const info_body(),
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.panier),
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
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "   Information de livraison",
          style: TextStyle(color: Colors.black),
        ));
  }
}
