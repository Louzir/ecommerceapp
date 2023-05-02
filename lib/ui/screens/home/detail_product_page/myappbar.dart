import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';


class MyAppBar extends StatefulWidget {
  final String nameProduct;
  final String uidProduct;

  const MyAppBar({
    Key? key,
    required this.nameProduct,
    required this.uidProduct,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
                  splashRadius: 20,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                TextFrave(
                  text: widget.nameProduct,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: const Color(
                    0xFF222D61,
                  ),
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
