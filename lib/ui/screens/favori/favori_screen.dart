import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/navigbar.dart';
import 'package:flutter_ecommerce_app/ui/components/enums.dart';
import 'package:flutter_ecommerce_app/ui/screens/favori/components/favori_body.dart';

class FavoriteScreen extends StatefulWidget {
  static String routeName = "/favori";

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body: Bodyfavori(),
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.favorites),
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
      title: Column(
        children: [
          const Text(
            "Favorites",
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 6),
          Text(
            "0 items",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
