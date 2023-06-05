import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/screens/login/login.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Helpers/validation_form.dart';

class SignupPage extends StatefulWidget {
  static String routeName = "/signup";

  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> {
  bool _isObscure = true;
  void _toggleObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  late TextEditingController userController;
  late TextEditingController emailController;
  late TextEditingController passowrdController;
  late TextEditingController passController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userController = TextEditingController();
    emailController = TextEditingController();
    passowrdController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    clear();
    userController.dispose();
    emailController.dispose();
    passowrdController.dispose();
    passController.dispose();
    super.dispose();
  }

  void clear() {
    userController.clear();
    emailController.clear();
    passowrdController.clear();
    passController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context, 'Validating...');
        }
        if (state is SuccessUserState) {
          Navigator.of(context).pop();
          modalSuccess(context, 'USER CREATED', onPressed: () {
            clear();
            Navigator.pushReplacement(
                context, routeSlide(page: const LoginPage()));
          });
        }
        if (state is FailureUserState) {
          Navigator.of(context).pop();
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 30),
              // Container(
              //   padding: const EdgeInsets.only(right: 140, left: 140),
              //   child: Container(
              //     height: 80,
              //     decoration: const BoxDecoration(
              //       color: Color(0xff6c63ff),
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(16.0),
              //       ),
              //     ),
              //     child: SizedBox(
              //       child: Image.asset('assets/logo.png'),
              //     ),
              //   ),
              // ),
              Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logoVF.png')))),
              // const SizedBox(height: 0),
              // const SizedBox(
              //   height: 40,
              //   child: Text(
              //     'Welcome',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xff1E4DD8),
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 0),
              TextFormField(
                controller: userController,
                validator:
                    RequiredValidator(errorText: 'User name is required'),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
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
              const SizedBox(height: 25),
              TextFormField(
                obscureText: _isObscure,
                controller: passowrdController,
                validator: passwordValidator,
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
              const SizedBox(height: 25),
              TextFormField(
                controller: passController,
                validator: (val) =>
                    MatchValidator(errorText: 'Password do not match')
                        .validateMatch(val!, passowrdController.text),
                obscureText: _isObscure,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 15.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Repeat Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: _toggleObscure,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 45,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  //color: Colors.red,
                  child: const Text('Sign UP'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      userBloc.add(OnAddNewUser(
                          userController.text.trim(),
                          emailController.text.trim(),
                          passowrdController.text.trim()));
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 8),
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
              const SizedBox(height: 25),
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
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
