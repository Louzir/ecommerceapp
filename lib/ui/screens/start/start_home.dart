import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/screens/login/login.dart';
import 'package:flutter_ecommerce_app/ui/screens/signup/signup.dart';

import '../../components/widgets.dart';

class StartHome extends StatelessWidget {
  const StartHome({super.key});
  static String routeName = "/start_home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E4DD8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 180,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo.png')))),
                    const SizedBox(height: 15.0),
                    const TextFrave(
                        text: 'E_Commerce',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    const SizedBox(height: 10.0),
                    const TextFrave(
                        text: 'All your products in your hands',
                        fontSize: 20,
                        color: Colors.white70),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff1C2834))),
                        onPressed: () =>
                            Navigator.pushNamed(context, SignupPage.routeName),
                        child: const Text(' Sign_UP'),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(const BorderSide(
                            color: Colors.blue,
                            width: 1.5,
                          )),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text('Sign Up with Google'),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextFrave(
                            text: 'Already have an account?', fontSize: 17),
                        TextButton(
                          child: const TextFrave(
                              text: 'Sign In',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          onPressed: () =>
                              Navigator.pushNamed(context, LoginPage.routeName),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
