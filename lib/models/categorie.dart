class Categorie {
  final String icon, title;

  Categorie({
    required this.icon,
    required this.title,
  });
}

// ignore: non_constant_identifier_names
List<Categorie> demo_categories = [
  Categorie(
    icon: "assets/restaurant.svg",
    title: "Nourriture",
  ),
  Categorie(
    icon: "assets/clothes.svg",
    title: "Shopping",
  ),
  Categorie(
    icon: "assets/voiture.svg",
    title: "Voiture",
  ),
  Categorie(
    icon: "assets/bébé.svg",
    title: "bébé",
  ),
];
