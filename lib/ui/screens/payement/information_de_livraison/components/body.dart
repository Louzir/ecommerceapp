// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/methode_de_pay/methodepay_screen.dart';

class info_body extends StatefulWidget {
  const info_body({super.key});
  @override
  State<info_body> createState() => _info_bodyState();
}

class _info_bodyState extends State<info_body> {
  bool isChecked1 = true;
  bool isChecked2 = false;
  int? selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Inforamtion de Livraison",
                    style: TextStyle(
                        color: Color.fromARGB(230, 65, 38, 100),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(width: getProportionateScreenWidth(30)),
                  InkWell(
                    onTap: () {},
                    child: const Text('modifier',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  width: getProportionateScreenWidth(350),
                  height: getProportionateScreenHeight(170),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 30),
                            Text("Chagara"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 30),
                            Text("Rue Farhat Hached,\nsahloul 4000,\nSousse"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 30),
                            Text("+216 55 585 855"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: getProportionateScreenWidth(350),
                  height: getProportionateScreenHeight(400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Méthode de service ",
                        style: TextStyle(
                          color: Color.fromARGB(230, 65, 38, 100),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked1,
                            onChanged: (value) {
                              setState(() {
                                isChecked1 = value!;
                                isChecked2 = !value;
                              });
                            },
                            activeColor: Colors.transparent,
                            checkColor: Colors.blue,
                            fillColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                          ),
                          const Text('Livraison à domicile'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked2,
                            onChanged: (value) {
                              setState(() {
                                isChecked2 = value!;
                                isChecked1 = !value;
                              });
                            },
                            fillColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            activeColor: Colors.transparent,
                            checkColor: Colors.blue,
                          ),
                          const Text('Retrait en magasin'),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      const Text(
                        'Méthode de payement',
                        style: TextStyle(
                          color: Color.fromARGB(230, 65, 38, 100),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      Container(
                        width: getProportionateScreenWidth(350),
                        height: getProportionateScreenHeight(110),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            )),
                        child: Column(
                          children: [
                            RadioListTile(
                              title: const Text("payement en ligne"),
                              value: 1,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text("Payement à la livraison"),
                              value: 2,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(25)),
                      SizedBox(
                        width: getProportionateScreenWidth(350),
                        height: getProportionateScreenHeight(45),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent)),
                          //color: Colors.red,
                          child: const Text('Commander'),
                          onPressed: () => Navigator.pushNamed(
                              context, Methode_pay.routeName),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
