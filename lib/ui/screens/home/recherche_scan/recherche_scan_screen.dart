// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/recherche_scan/components/body.dart';

import '../../../components/navigbar.dart';
import '../../../components/enums.dart';

class Rech_scan extends StatefulWidget {
  const Rech_scan({super.key});
  static String routeName = "/scan";
  @override
  State<Rech_scan> createState() => _Rech_scanState();
}

class _Rech_scanState extends State<Rech_scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body: const body(),
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.home),
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
          "   Recherche Par Scan",
          style: TextStyle(color: Colors.black),
        ));
  }
}
