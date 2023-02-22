
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/favori/favori_screen.dart';
import 'package:flutter_ecommerce_app/screens/home/home.dart';
import 'package:flutter_ecommerce_app/screens/panier/panier_screen.dart';
import 'package:flutter_ecommerce_app/screens/screen_4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigBar(),
    );
  }
}

class NavigBar extends StatefulWidget {
  const NavigBar({super.key});

  @override
  State<NavigBar> createState() => NavigBarState();
}

class NavigBarState extends State<NavigBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Home(),
    const Screen4(),
    const Favori(),
    const PanierScreen(),
  ];

  void onTapperBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTapperBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Store',
            icon: Icon(Icons.store),
          ),
          BottomNavigationBarItem(
            label: 'Favori',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Panier',
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
    );
  }
}
