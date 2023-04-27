// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/horaires/components/body.dart';

import '../../../components/navigbar.dart';
import '../../../components/enums.dart';

class Horaires_screen extends StatefulWidget {
  const Horaires_screen({super.key});
  static String routeName = "/horaires_screen";
  @override
  State<Horaires_screen> createState() => _Horaires_screenState();
}

class _Horaires_screenState extends State<Horaires_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body:  const MyScreen(),
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
          "   Horaire souhaitée",
          style: TextStyle(color: Colors.black),
        ));
  }
}
