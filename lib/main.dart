import 'package:flutter/material.dart';
import 'screens/splash_screen/demarrage.dart';
import 'package:flutter_ecommerce_app/components/size_config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}
