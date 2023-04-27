import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/Helpers/validation_form.dart';
import 'package:flutter_ecommerce_app/ui/screens/forgot_pass/forgot_pass.dart';
import 'package:flutter_ecommerce_app/ui/screens/signup/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Auth/auth_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/home.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import '../../components/size_config.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _rememberMe = false;
  late TextEditingController _emailController;
  late TextEditingController _passowrdController;
  final _keyForm = GlobalKey<FormState>();

  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passowrdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _emailController.dispose();
    _passowrdController.clear();
    _passowrdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          modalLoading(context, 'Checking...');
        } else if (state is FailureAuthState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SuccessAuthState) {
          Navigator.pop(context);
          userBloc.add(OnGetUserEvent());
          Navigator.pushAndRemoveUntil(
              context, routeSlide(page: const Home()), (_) => false);
        }
      },
      child: Scaffold(
        body: Form(
          key: _keyForm,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 90),
              Container(
                padding: const EdgeInsets.only(right: 140, left: 140),
                child: Container(
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
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 50,
                child: Text(
                  'Bienvenue marque B',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 69, 220),
                    fontSize: 20,
                  ),
                ),
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: validatedEmail,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passowrdController,
                validator: passwordValidator,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 15.0),
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
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  //color: Colors.red,
                  child: const Text('Sign In'),
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      authBloc.add(LoginEvent(_emailController.text.trim(),
                          _passowrdController.text.trim()));
                    }
                  },
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
                    textAlign: TextAlign.center,
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
                              builder: (context) => SignupPage()));
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
