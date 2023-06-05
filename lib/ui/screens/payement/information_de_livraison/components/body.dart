// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/methode_de_pay/methodepay_screen.dart';

import '../../../../../Bloc/user/user_bloc.dart';
import '../../../../components/shimmer_frave.dart';
import '../../../../components/widgets.dart';
import '../../../profile/information_page.dart';
import '../../horaires/horaire_screen.dart';

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
                    "Delivery information",
                    style: TextStyle(
                        color: Color.fromARGB(230, 65, 38, 100),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(width: getProportionateScreenWidth(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InformationPage(),
                        ),
                      );
                    },
                    child: const Text('edit',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) => state.user != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            width: getProportionateScreenWidth(350),
                            height: getProportionateScreenHeight(170),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.person_2_outlined,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 30),
                                      TextFrave(
                                          text: state.user!.firstName,
                                          fontSize: 16),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 30),
                                      TextFrave(
                                          text: state.user!.address,
                                          fontSize: 16),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.phone_outlined,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 30),
                                      TextFrave(
                                          text: state.user!.phone,
                                          fontSize: 16),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const ShimmerFrave()),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: getProportionateScreenWidth(350),
                  height: getProportionateScreenHeight(400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "service method ",
                        style: TextStyle(
                          color: Color.fromARGB(230, 65, 38, 100),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
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
                          const Text(
                            'Home delivery',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
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
                          const Text(
                            'Pick up in store',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      const Text(
                        'Payment method',
                        style: TextStyle(
                          color: Color.fromARGB(230, 65, 38, 100),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
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
                              title: const Text("online payment"),
                              value: 1,
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                            ),
                            RadioListTile(
                              title: const Text("Cash on delivery"),
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
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            if (selectedValue == 1) {
                              Navigator.pushNamed(
                                  context, Methode_pay.routeName);
                            } else {
                              Navigator.pushNamed(
                                  context, Horaires_screen.routeName);
                            }
                          },
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
