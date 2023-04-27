// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../../components/navigbar.dart';
import '../../../components/enums.dart';
import 'components/body.dart';

class Methode_pay extends StatefulWidget {
  const Methode_pay({super.key});
  static String routeName = "/methode_de_payment";
  @override
  State<Methode_pay> createState() => _Methode_payState();
}

class _Methode_payState extends State<Methode_pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: builAppBar(context),
      body: const Meth_body(),
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
          "   Méthode de payement",
          style: TextStyle(color: Colors.black),
        ));
  }
}
