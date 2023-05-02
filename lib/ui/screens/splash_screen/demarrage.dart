import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Auth/auth_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/start/start_home.dart';

import '../home/home.dart';

class Screen1 extends StatefulWidget {
  static String routeName = "/demarrage";

  const Screen1({super.key});
  @override
  State<Screen1> createState() => FirstPageState();
}

class FirstPageState extends State<Screen1> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_animationController);

    _animation.addStatusListener(_animationListener);

    _animationController.forward();
    // Timer(const Duration(seconds: 2), () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const Screen2(),
    //     ),
    //   );
    // });
  }

  _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.removeStatusListener(_animationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogOutState) {
          Navigator.of(context).pushAndRemoveUntil(
              routeFade(page: const StartHome()), (_) => false);
        } else if (state is SuccessAuthState) {
          userBloc.add(OnGetUserEvent());
          Navigator.of(context)
              .pushAndRemoveUntil(routeSlide(page:  Home()), (_) => false);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff1E4DD8),
        body: Center(
          child: SizedBox(
            height: 180,
            width: 181,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (_, child) => Transform.scale(
                    scale: _animation.value * 2.7, // Changer la valeur de scale
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                const SizedBox(height: 100),
                const TextFrave(
                    text: 'Verifying your device...', color: Colors.white60)
              ],
            ),
          ),
        ),
      ),
    );

    // child:Scaffold(
    //   home: Scaffold(
    //     body: Container(
    //       color: const Color(0xff4D6AEE),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           const SizedBox(
    //             width: double.infinity,
    //             child: Image(
    //               image: AssetImage("assets/Groupe 142.png"),
    //             ),
    //           ),
    //           /*const SizedBox(
    //             child: Text(
    //               "Marque blanche",
    //               style: TextStyle(
    //                 fontSize: 30,
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ),*/
    //           Container(
    //             margin: const EdgeInsets.all(130),
    //             child: const CircularProgressIndicator.adaptive(
    //               backgroundColor: Colors.transparent,
    //               strokeWidth: 5,
    //               valueColor: AlwaysStoppedAnimation<Color>(Colors.white30),
    //             ),
    //           ),
    //           const SizedBox(
    //             child: Text(
    //               "Soyez au cœur de votre magasin",
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontStyle: FontStyle.normal),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
