import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/General/general_bloc.dart';
import 'package:flutter_ecommerce_app/ui/screens/favori/favori_screen.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/home.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/profile_drawer.dart';
import 'package:flutter_ecommerce_app/ui/screens/store/screen_4.dart';
import 'constants.dart';
import 'package:flutter_ecommerce_app/ui/components/enums.dart';
/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigBar(),
    );
  }
}

class NavigBar extends StatefulWidget {
  const NavigBar({super.key});

  @override
  State<NavigBar> createState() => NavigBarState();
}

class NavigBarState extends State<NavigBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Home(),
    const Screen4(),
    const FavoriteScreen(),
    const PanierScreen(),
  ];

  void onTapperBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTapperBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Store',
            icon: Icon(Icons.store),
          ),
          BottomNavigationBarItem(
            label: 'Favori',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Panier',
            icon: Icon(Icons.shopping_basket),
          ),
        ],
      ),
    );
  }
}*/

class NavigBar extends StatelessWidget {
  const NavigBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return BlocBuilder<GeneralBloc, GeneralState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) => AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (state.showMenuHome) ? 1 : 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: MenuState.home == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, Home.routeName),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.store,
                      color: MenuState.store == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, Screen4.routeName),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: MenuState.favorites == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, FavoritePage.routeName),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      color: MenuState.profile == selectedMenu
                          ? kPrimaryColor
                          : inActiveIconColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, Drawer_profile.routeName),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
