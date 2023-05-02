import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/ui/components/widgets.dart';

class NameProduct extends StatefulWidget {
  final String nameProduct;
  final String uidProduct;
  final int isFavorite;
  final double price;

  const NameProduct({
    Key? key,
    required this.nameProduct,
    required this.uidProduct,
    required this.isFavorite,
    required this.price,
  }) : super(key: key);

  @override
  State<NameProduct> createState() => _NameProductState();
}

class _NameProductState extends State<NameProduct> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite == 1;
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFrave(
                  text: widget.nameProduct,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(
                    0xFF595959,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xffF5F5F5),
                  radius: 24,
                  child: IconButton(
                    icon: _isFavorite
                        ? Icon(Icons.favorite_rounded, color: Colors.red)
                        : Icon(Icons.favorite_border_rounded,
                            color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                      productBloc.add(OnAddOrDeleteProductFavoriteEvent(
                          uidProduct: widget.uidProduct));
                    },
                  ),
                ),
              ],
            ),
            TextFrave(
              text: '${widget.price.toString()} TND',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(
                0xFF222D61,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
