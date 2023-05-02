import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/favori/favori_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/forgot_pass/forgot_pass.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/components/search.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/home.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/recherche_scan/recherche_scan_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/horaires/horaire_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/information_de_livraison/infoscreen.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/methode_de_pay/methodepay_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/information_page.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/login_drawer.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/my_shopping/shopping_page.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/profile_drawer.dart';
import 'package:flutter_ecommerce_app/ui/screens/login/login.dart';
import 'package:flutter_ecommerce_app/ui/screens/payement/paiement_reussi.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/panier_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/start/start_home.dart';
import 'package:flutter_ecommerce_app/ui/screens/store/screen_4.dart';
import 'package:flutter_ecommerce_app/ui/screens/signup/signup.dart';
import 'package:flutter_ecommerce_app/ui/screens/splash_screen/demarrage.dart';
import 'package:flutter_ecommerce_app/ui/screens/splash_screen/select_image.dart';
import 'package:flutter_ecommerce_app/ui/screens/splash_screen/three_pages.dart';

final Map<String, WidgetBuilder> routes = {
  Screen1.routeName: (context) => const Screen1(),
  Screen2.routeName: (context) => const Screen2(),
  Screen3.routeName: (context) => const Screen3(),
  Home.routeName: (context) =>  Home(),
  Screen4.routeName: (context) => const Screen4(),
  FavoritePage.routeName: (context) => FavoritePage(),
  PanierScreen.routeName: (context) => const PanierScreen(),
  ForgotPasswordModal.routeName: (context) => const ForgotPasswordModal(),
  Drawer_profile.routeName: (context) => const Drawer_profile(),
  Login_Drawer.routeName: (context) => const Login_Drawer(),
  LoginPage.routeName: (context) => LoginPage(),
  SignupPage.routeName: (context) => SignupPage(),
  PaymentSuccessPage.routeName: (context) => const PaymentSuccessPage(),
  Info_livraison.routeName: (context) => const Info_livraison(),
  Methode_pay.routeName: (context) => const Methode_pay(),
  Horaires_screen.routeName: (context) => const Horaires_screen(),
  Rech_scan.routeName: (context) => const Rech_scan(),
  Search.routeName: (context) => const Search(),
  StartHome.routeName: (context) => const StartHome(),
  InformationPage.routeName: (context) => const InformationPage(),
  ShoppingPage.routeName: (context) => const ShoppingPage(),
};
