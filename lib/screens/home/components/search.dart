import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Form(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Recherche...",
                filled: true,
                fillColor: Colors.white,
                border: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset("assets/Search.svg"),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/scan.png"),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/notification.png"),
        ),
      ],
    );
  }
}
