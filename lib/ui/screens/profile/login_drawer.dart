import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/home.dart';
import 'package:flutter_ecommerce_app/ui/screens/login/login.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/panier_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/signup/signup.dart';
import 'package:flutter_ecommerce_app/ui/screens/store/screen_4.dart';

import '../favori/favori_screen.dart';

// ignore: camel_case_types
class Login_Drawer extends StatelessWidget {
  const Login_Drawer({super.key});
  static String routeName = "/Login_drawer";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(100)),
          SizedBox(
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenHeight(40),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              onPressed: () =>
                  Navigator.pushNamed(context, LoginPage.routeName),
              child: const Text(' Sign_In'),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenHeight(40),
            child: OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(const BorderSide(
                  color: Colors.blue,
                  width: 1.5,
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, SignupPage.routeName),
              child: const Text('Sign_Up'),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          const Divider(
            thickness: 1.5,
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pushNamed(context, Home.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Store'),
            onTap: () => Navigator.pushNamed(context, Screen4.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorites'),
            onTap: () => Navigator.pushNamed(context, FavoritePage.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Cart'),
            onTap: () => Navigator.pushNamed(context, PanierScreen.routeName),
          ),
          const Divider(
            thickness: 0.8,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_center),
            title: const Text('Help Center'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
