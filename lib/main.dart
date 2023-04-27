import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Auth/auth_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/General/general_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/category/category_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/Routes/routes.dart';
import 'Bloc/Product/product_bloc.dart';
import 'ui/screens/splash_screen/demarrage.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => AuthBloc()..add(CheckLoginEvent())),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => GeneralBloc()),
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Poppins"),
        initialRoute: Screen1.routeName,
        routes: routes,
      ),
    );
  }
}
