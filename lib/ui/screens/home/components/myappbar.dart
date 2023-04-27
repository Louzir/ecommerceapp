// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/home.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  bool _isSearching = false;

  void _onSearchPressed() {
    setState(() {
      _isSearching = true;
    });
  }

  void _onCancelSearch() {
    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: _isSearching
          ? IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: _onCancelSearch,
            )
          : null,
      title: _isSearching
          ? TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Handle search query changes
              },
            )
          : Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pushNamed(context, Home.routeName),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Nike Air Max",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: _onSearchPressed,
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    );
  }
}
