// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/horaires/horaire_screen.dart';

class Meth_body extends StatefulWidget {
  const Meth_body({super.key});

  @override
  State<Meth_body> createState() => _Meth_bodyState();
}

class _Meth_bodyState extends State<Meth_body> {
  bool isChecked1 = true;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "N° de commande",
                    style: TextStyle(
                        color: Color.fromARGB(230, 65, 38, 100),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(width: getProportionateScreenWidth(30)),
                  const Text(
                    "337.150 TND",
                    style: TextStyle(
                        color: Color.fromARGB(230, 65, 38, 100),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "4587256",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                  SizedBox(width: getProportionateScreenWidth(30)),
                  const Text(
                    "inclue 7.00 TND",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked1 = !isChecked1;
                        isChecked2 = !isChecked1;
                      });
                    },
                    child: Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color:
                            isChecked1 ? const Color(0xff6c63ff) : Colors.white,
                        border: Border.all(
                          color: isChecked1
                              ? const Color(0xff6c63ff)
                              : const Color(0xff6c63ff),
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card_outlined,
                            color: isChecked1
                                ? Colors.white
                                : const Color(0xff6c63ff),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "Credit card",
                            style: TextStyle(
                              color: isChecked1
                                  ? Colors.white
                                  : const Color(0xff6c63ff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(23)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked2 = !isChecked2;
                        isChecked1 = !isChecked2;
                      });
                    },
                    child: Container(
                      width: getProportionateScreenWidth(155),
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color:
                            isChecked2 ? const Color(0xff6c63ff) : Colors.white,
                        border: Border.all(
                          color: isChecked2
                              ? const Color(0xff6c63ff)
                              : const Color(0xff6c63ff),
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/web pay icon.png',
                            height: 24,
                            width: 24,
                            color: isChecked2
                                ? Colors.white
                                : const Color(0xff6c63ff),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Webpay",
                            style: TextStyle(
                              color: isChecked2
                                  ? Colors.white
                                  : const Color(0xff6c63ff),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              const Divider(
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              const SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    prefixIcon: Icon(Icons.credit_card),
                    hintText: 'XXXX XXXX XXXX XXXX',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Numéro de la carte',
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              const SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    prefixIcon: Icon(Icons.person_2_outlined),
                    hintText: 'Foulan Ben Foulan',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Titulaire de la carte',
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    width: 160,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.date_range),
                        hintText: 'MM/YY',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: "Date d'exp",
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                  const SizedBox(
                    width: 160,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'XXX',
                        hintStyle: TextStyle(color: Colors.grey),
                        labelText: 'CVV/CVC',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              const Divider(
                thickness: 1.5,
                endIndent: 20,
                indent: 20,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              const SizedBox(
                child: Text(
                  "Nous vous enverrons les détails de la commande à\n     votre adresse e-mail après le paiement réussi.",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              SizedBox(
                width: getProportionateScreenWidth(350),
                height: getProportionateScreenHeight(45),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  //color: Colors.red,
                  child: const Text('Commander'),
                  onPressed: () =>
                      Navigator.pushNamed(context, Horaires_screen.routeName),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
