import 'package:flutter/material.dart';

class Categorie {
  final String icon, title;
  final Color color;
  Categorie({
    required this.icon,
    required this.title,
    required this.color,
  });
}

// ignore: non_constant_identifier_names
List<Categorie> demo_categories = [
  Categorie(
    icon: "assets/restaurant.svg",
    title: "Nourriture",
    color: Colors.blue,
  ),
  Categorie(
    icon: "assets/clothes.svg",
    title: "Shopping",
    color: Colors.red,
  ),
  Categorie(
    icon: "assets/voiture.svg",
    title: "Voiture",
    color: Colors.blue,
  ),
  Categorie(
    icon: "assets/bébé.svg",
    title: "bébé",
    color: Colors.orange,
  ),
];
