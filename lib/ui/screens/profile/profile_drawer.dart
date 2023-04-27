import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/General/general_bloc.dart';
import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/panier_screen.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/information_page.dart';
import 'package:flutter_ecommerce_app/ui/screens/profile/my_shopping/shopping_page.dart';
import 'package:flutter_ecommerce_app/ui/screens/start/start_home.dart';
import 'package:flutter_ecommerce_app/ui/themes/colors_frave.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../Bloc/Auth/auth_bloc.dart';
import '../../../Helpers/helpers.dart';
import '../../components/shimmer_frave.dart';
import '../favori/favori_screen.dart';

// ignore: camel_case_types
class Drawer_profile extends StatefulWidget {
  const Drawer_profile({super.key});
  static String routeName = "/drawer_profile";

  @override
  State<Drawer_profile> createState() => _Drawer_profileState();
}

// ignore: camel_case_types
class _Drawer_profileState extends State<Drawer_profile> {
  late ScrollController _scrollController;
  double scrollPrevious = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(addListenerScroll);

    super.initState();
  }

  void addListenerScroll() {
    if (_scrollController.offset > scrollPrevious) {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: false));
    } else {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: true));
    }
    scrollPrevious = _scrollController.offset;
  }

  @override
  void dispose() {
    _scrollController.removeListener(addListenerScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context, 'Loading...');
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SetUserState) {
          Navigator.pop(context);
        }
      },
      child: Drawer(
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
          children: [
            BlocBuilder<UserBloc, UserState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) => state.user != null
                    ? Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: state.user != null &&
                                      state.user?.image == ''
                                  ? GestureDetector(
                                      onTap: () => modalSelectPicture(
                                            context: context,
                                            onPressedImage: () async {
                                              Navigator.pop(context);
                                              AccessPermission()
                                                  .permissionAccessGalleryOrCameraForProfile(
                                                      await Permission.storage
                                                          .request(),
                                                      context,
                                                      ImageSource.gallery);
                                            },
                                            onPressedPhoto: () async {
                                              Navigator.pop(context);
                                              AccessPermission()
                                                  .permissionAccessGalleryOrCameraForProfile(
                                                      await Permission.camera
                                                          .request(),
                                                      context,
                                                      ImageSource.camera);
                                            },
                                          ),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor:
                                            ColorsFrave.primaryColorFrave,
                                        child: TextFrave(
                                            text: state.user!.users
                                                .substring(0, 2)
                                                .toUpperCase(),
                                            fontSize: 40,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ))
                                  : GestureDetector(
                                      onTap: () => modalSelectPicture(
                                        context: context,
                                        onPressedImage: () async {
                                          Navigator.pop(context);
                                          AccessPermission()
                                              .permissionAccessGalleryOrCameraForProfile(
                                                  await Permission.storage
                                                      .request(),
                                                  context,
                                                  ImageSource.gallery);
                                        },
                                        onPressedPhoto: () async {
                                          Navigator.pop(context);
                                          AccessPermission()
                                              .permissionAccessGalleryOrCameraForProfile(
                                                  await Permission.camera
                                                      .request(),
                                                  context,
                                                  ImageSource.camera);
                                        },
                                      ),
                                      child: Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    URLS.baseUrl +
                                                        state.user!.image))),
                                      ),
                                    )),
                          const SizedBox(width: 15.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BounceInRight(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: TextFrave(
                                        text: state.user!.users,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500)),
                              ),
                              FadeInRight(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: TextFrave(
                                        text: state.user!.email,
                                        fontSize: 18,
                                        color: Colors.grey)),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const ShimmerFrave()),
            const SizedBox(height: 40),
            const Divider(
              height: 1,
              thickness: 0.5,
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              onTap: () =>
                  Navigator.pushNamed(context, InformationPage.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () =>
                  Navigator.pushNamed(context, FavoriteScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Cart'),
              onTap: () => Navigator.pushNamed(context, PanierScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('My shopping'),
              onTap: () => Navigator.pushNamed(context, ShoppingPage.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {},
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: const Center(
                    child: Text(
                      '8',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 1,
              thickness: 0.8,
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help_center),
              title: const Text('Help Center'),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 1,
              thickness: 0.8,
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('LogOut'),
              leading: const Icon(Icons.logout),
              onTap: () {
                context.read<AuthBloc>().add(LogOutEvent());
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const StartHome()),
                  (route) => false, // Supprimer toutes les routes existantes
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
