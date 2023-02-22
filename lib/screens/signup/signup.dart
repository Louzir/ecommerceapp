import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/login/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> {
  bool _isObscure = true;

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
              const SizedBox(height: 60),
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
                height: 50,
                child: Text(
                  'Bienvenue marque B',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 69, 220),
                    fontSize: 20,
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'Last Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'First Name',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 350,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: 'Phone Namber',
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  //color: Colors.red,
                  child: const Text('Sign UP'),
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
                        'SignUp with Google',
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
                        'SignUp with Facebook',
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
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.black38),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text('LogIn',
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
