import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Auth/auth_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/General/general_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/slider/slider.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/profile_drawer.dart';
import 'package:flutter_ecommerce_app/ui/themes/colors_frave.dart';
import '../../../Bloc/Product/product_bloc.dart';
import '../../components/navigbar.dart';
import '../../components/enums.dart';

import 'categorie/list_categories_home.dart';
import 'components/list_products_home.dart';
import 'components/search.dart';
import 'components/sectiontitle.dart';

class Home extends StatefulWidget {
  static String routeName = "/Home";
  @override
  State<Home> createState() => Home4State();
}

class Home4State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is LoadingProductState) {
          modalLoadingShort(context);
        } else if (state is FailureProductState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SuccessProductState) {
          Navigator.pop(context);
          setState(() {});
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Stack(
          children: [
            HomePage(),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  static String routeName = "/Home";
  @override
  HomePage4State createState() => HomePage4State();
}

class HomePage4State extends State<HomePage> {
  late ScrollController _scrollControllerHome;
  double scrollPrevious = 0;

  @override
  void initState() {
    _scrollControllerHome = ScrollController();
    _scrollControllerHome.addListener(addListenerMenu);
    super.initState();
  }

  void addListenerMenu() {
    if (_scrollControllerHome.offset > scrollPrevious) {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: false));
    } else {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: true));
    }

    scrollPrevious = _scrollControllerHome.offset;
  }

  @override
  void dispose() {
    _scrollControllerHome.removeListener(addListenerMenu);
    _scrollControllerHome.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer_profile(),
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.home),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                text: "Nom de boutique",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nOuvert',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
                  ),
                  TextSpan(
                    text: ' Jusqu’à 9:00 Pm',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(top: 14, right: 10),
                child: Icon(Icons.keyboard_arrow_down),
              ),
              onPressed: () {
                // add onPressed callback
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollControllerHome,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Search(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),

                  Row(
                    children: [
                      FadeInLeft(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<UserBloc, UserState>(
                              buildWhen: (previous, current) =>
                                  previous != current,
                              builder: (context, state) => state.user != null
                                  ? Row(
                                      children: [
                                        Text(
                                          "Bonjour ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                        ),
                                        Text(
                                          state.user!.users,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Nous vous proposons des recommandations",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(25),
                      ),
                      FadeInLeft(
                        child: BlocBuilder<UserBloc, UserState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) => state.user != null
                                ? Row(
                                    children: [
                                      state.user!.image != ''
                                          ? CircleAvatar(
                                              radius: 25,
                                              backgroundImage: NetworkImage(
                                                  URLS.baseUrl +
                                                      state.user!.image),
                                            )
                                          : CircleAvatar(
                                              radius: 25,
                                              backgroundColor:
                                                  ColorsFrave.primaryColorFrave,
                                              child: TextFrave(
                                                text: state.user!.users
                                                    .substring(0, 2)
                                                    .toUpperCase(),
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                      const SizedBox(width: 5.0),
                                    ],
                                  )
                                : const SizedBox()),
                      ),
                    ],
                  ),
                  // add other widgets as needed
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10),
                child: Text(
                  "Catégories",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListCategoriesHome(),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SectionTitle(
                  title: "Juste pour vous",
                  pressSeeAll: () {},
                ),
              ),
              const ProductSlider(),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 10),
                child: Text(
                  "Product Name",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, left: 10),
                child: Text(
                  "25.00 TND",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7.0, left: 10),
                child: Text(
                  "Lörem ipsum sorad Madeleine Engström. Du kan \nvara drabbad. Krofask nystartsjobb det vill säga.",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 15),
                ),
              ),
              const ListProductsForHome(),
            ],
          ),
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(width: 1.5, color: Colors.black45),
);
