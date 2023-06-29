import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/General/general_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/slider/slider.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/panier_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/information_page.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/profile_drawer.dart';
import 'package:flutter_ecommerce_app/ui/themes/colors_frave.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Bloc/Product/product_bloc.dart';
import '../../components/navigbar.dart';
import '../../components/enums.dart';

import 'categorie/list_categories_home.dart';
import 'components/list_products_home.dart';
import 'components/search.dart';
import 'components/sectiontitle.dart';

class Home extends StatefulWidget {
  static String routeName = "/Home";

  const Home({super.key});
  @override
  State<Home> createState() => Home4State();
}

String _getImagePath(int index) {
  List<String> imagePaths = [
    'assets/shop.png', 
    'assets/B2B.png',
    'assets/shipping.png', 
    'assets/food.png', 
  ];
  return imagePaths[index];
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
      child: const Scaffold(
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
  const HomePage({super.key});
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
      drawer: const Drawer_profile(),
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.home),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                TextFrave(
                  text: 'E_commerce ',
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                TextFrave(
                  text: 'marque_B',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                  routeSlide(page:  const PanierScreen()), (_) => false),
              child: Stack(
                children: [
                  FadeInRight(
                      child: SizedBox(
                          height: 32,
                          width: 32,
                          child: SvgPicture.asset('assets/bolso-negro.svg',
                              height: 25))),
                  Positioned(
                    left: 0,
                    top: 12,
                    child: FadeInDown(
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: ColorsFrave.primaryColorFrave,
                            shape: BoxShape.circle),
                        child: Center(
                            child: BlocBuilder<ProductBloc, ProductState>(
                                builder: (context, state) => state.amount == 0
                                    ? const TextFrave(
                                        text: '0',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)
                                    : TextFrave(
                                        text: '${state.products!.length}',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                      ),
                    ),
                  )
                ],
              ),
            )
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
                                          "Welcome ",
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
                              "We offer recommendations",
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
                        width: getProportionateScreenWidth(135),
                      ),
                      FadeInLeft(
                        child: BlocBuilder<UserBloc, UserState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) => state.user != null
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const InformationPage()),
                                      );
                                    },
                                    child: state.user!.image != ''
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
                  "Categories",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.purple,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListCategoriesHome(),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SectionTitle(
                  title: "Just for you",
                  pressSeeAll: () {},
                ),
              ),
              const ProductSlider(),
              const SizedBox(
                height: 18,
              ),
              const Divider(
                height: 1,
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "discover our offers and services",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    width:
                        100, // Ajustez la largeur des images selon vos besoins
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26, // Couleur du cadre
                              width: 1, // Largeur du cadre
                            ),
                            borderRadius: BorderRadius.circular(
                                5), // Bordure arrondie du cadre
                            image: DecorationImage(
                              image: AssetImage(
                                _getImagePath(index), // Méthode pour obtenir le chemin de l'image en fonction de l'index
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SectionTitle(
                  title: "Our product",
                  pressSeeAll: () {},
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
