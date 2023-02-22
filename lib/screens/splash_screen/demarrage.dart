import 'dart:async';

import 'package:flutter/material.dart';

import 'three_pages.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    // Navigation will be triggered after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Screen2(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color(0xff6c63ff),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Image(
                  image: AssetImage("assets/panier1.jpeg"),
                ),
              ),
              const SizedBox(
                child: Text(
                  "Marque blanche",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(150),
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(
                child: Text(
                  "Soyez au cœur de votre magasin",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
