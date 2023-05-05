// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class SelectColor extends StatefulWidget {
  const SelectColor({super.key});

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  int selectedColor = -1;
  @override
  Widget build(BuildContext context) {
    List<MaterialColor> Clrs = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.orange,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        const Text(
          "Select Color",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(
              0xFF595959,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < 5; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = i;
                    });
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Clrs[i],
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: selectedColor == i
                            ? Colors.black
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ]),
    );
  }
}
