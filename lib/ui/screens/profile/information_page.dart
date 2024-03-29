import 'package:flutter_ecommerce_app/Service/urls.dart';
import 'package:flutter_ecommerce_app/ui/components/shimmer_frave.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/user/user_bloc.dart';
import 'package:flutter_ecommerce_app/Helpers/helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../themes/colors_frave.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});
  static String routeName = "/informationpage";
  @override
  // ignore: library_private_types_in_public_api
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late TextEditingController _firstnameController;
  late TextEditingController _lastnameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _referenceController;
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  void initData() {
    final userBloc = BlocProvider.of<UserBloc>(context).state.user!;
    _firstnameController = TextEditingController(text: userBloc.firstName);
    _lastnameController = TextEditingController(text: userBloc.lastName);
    _phoneController = TextEditingController(text: userBloc.phone);
    _addressController = TextEditingController(text: userBloc.address);
    _referenceController = TextEditingController(text: userBloc.reference);
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context, 'Checking...');
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        } else if (state is SetUserState) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const TextFrave(
              text: 'My Profile',
              color: Colors.black,
              fontWeight: FontWeight.w500),
          centerTitle: true,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  userBloc.add(OnUpdateInformationUserEvent(
                      _firstnameController.text.trim(),
                      _lastnameController.text.trim(),
                      _phoneController.text.trim(),
                      _addressController.text.trim(),
                      _referenceController.text.trim()));
                },
                child: const TextFrave(
                  text: 'Save',
                  color: Colors.redAccent,
                  fontSize: 16,
                ))
          ],
        ),
        body: Form(
          key: _keyForm,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            children: [
              BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) => state.user != null
                      ? SizedBox(
                          child: state.user != null && state.user?.image == ''
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
                                    radius: 50,
                                    backgroundColor:
                                        ColorsFrave.primaryColorFrave,
                                    child: TextFrave(
                                        text: state.user!.users
                                            .substring(0, 2)
                                            .toUpperCase(),
                                        fontSize: 35,
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
                                              await Permission.camera.request(),
                                              context,
                                              ImageSource.camera);
                                    },
                                  ),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.redAccent,
                                            width: 1.5),
                                        image: DecorationImage(
                                            // fit: BoxFit.cover,
                                            image: NetworkImage(URLS.baseUrl +
                                                state.user!.image))),
                                  ),
                                ))
                      : const ShimmerFrave()),
              const SizedBox(
                height: 20,
              ),
              const TextFrave(text: 'Account data', fontSize: 16),
              const SizedBox(height: 10.0),
              BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) => state.user != null
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0xff4C98EE).withOpacity(.1),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextFrave(
                                      text: 'User',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  TextFrave(
                                      text: state.user!.users, fontSize: 16),
                                ],
                              ),
                              const SizedBox(height: 15.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextFrave(
                                      text: 'Email',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  TextFrave(
                                      text: state.user!.email, fontSize: 16),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const ShimmerFrave()),
              const SizedBox(height: 30.0),
              const TextFrave(text: 'Personal Information', fontSize: 16),
              const SizedBox(height: 10.0),
              TextFormFrave(
                controller: _firstnameController,
                hintText: 'Enter your First Name',
                prefixIcon: const Icon(Icons.person_outline_rounded),
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _lastnameController,
                hintText: 'Enter Last Name',
                prefixIcon: const Icon(Icons.person_outline_rounded),
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _phoneController,
                hintText: 'Enter your Phone Number',
                prefixIcon: const Icon(Icons.phone_android_rounded),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _addressController,
                hintText: 'Street Address',
                prefixIcon: const Icon(Icons.home_outlined),
                keyboardType: TextInputType.streetAddress,
              ),
              const SizedBox(height: 20.0),
              TextFormFrave(
                controller: _referenceController,
                hintText: 'Reference',
                prefixIcon: const Icon(Icons.home_outlined),
                keyboardType: TextInputType.streetAddress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
