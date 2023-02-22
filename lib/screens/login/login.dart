import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/forgot_pass/forgot_pass.dart';
import 'package:flutter_ecommerce_app/screens/signup/signup.dart';

import '../../components/size_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _rememberMe = false;

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 90),
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xff6c63ff),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: SizedBox(
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 70,
                child: Text(
                  'Bienvenue marque B',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 69, 220),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _toggleObscure,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 30,
                child: Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    const Text(
                      "Remember Me",
                      style: TextStyle(fontSize: 15, color: Colors.black38),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  //color: Colors.red,
                  child: const Text('Sign In'),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 30,
                      thickness: 1,
                      indent: 30,
                      endIndent: 30,
                    ),
                  ),
                ],
              ),
              /*const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              height: 30,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              
              //text: Text('OR'),
            ),
            ),*/
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/google.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 75),
                      const Text(
                        'Login with Google',
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/facebook.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 70),
                      const Text(
                        'Login with Facebook',
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontSize: 15,
                        ),
                      )
                    ],

                    //icon: Image.asset('assets/facebook.png'),
                    // label: const Text(
                    // 'Login with Facebook',
                    // style: TextStyle(color: Colors.black38),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: getProportionateScreenWidth(800),
                        child: const ForgotPasswordModal(),
                      );
                    },
                  );
                }, // i
                child: const Text('Forgot Password ?',
                    style: TextStyle(fontSize: 15, color: Colors.black87)),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.black38),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    child: const Text('SignUp',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
