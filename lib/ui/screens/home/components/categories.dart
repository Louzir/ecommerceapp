import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ecommerce_app/ui/models/categorie.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demo_categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CategorieCard(
              icon: demo_categories[index].icon,
              title: demo_categories[index].title,
              color: demo_categories[index].color,
              press: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class CategorieCard extends StatelessWidget {
  const CategorieCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
    required this.color,
  }) : super(key: key);
  final String icon, title;
  final VoidCallback press;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: press,
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          side: BorderSide(color: color),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(height: 15),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ));
  }
}
