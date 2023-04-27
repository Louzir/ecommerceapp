import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/components/check_out_card.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/components/panier_card.dart';
import 'package:flutter_ecommerce_app/ui/screens/panier/components/without_product_cart.dart';

import '../../../components/size_config.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      bottomNavigationBar: const CheckoutCard(),
      body: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: productBloc.product.isEmpty
              ? const WithoutProductsCart()
              : const DetailsProductsCart()),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ecommerce_app/Bloc/Product/product_bloc.dart';
// import 'package:flutter_ecommerce_app/ui/models/panier.dart';
// import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
// import 'package:flutter_ecommerce_app/ui/screens/panier/components/check_out_card.dart';
// import 'package:flutter_ecommerce_app/ui/screens/panier/components/without_product_cart.dart';
// import 'package:flutter_svg/svg.dart';

// import 'panier_card.dart';

// class Body extends StatefulWidget {
//   const Body({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BodyState createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   @override
//   Widget build(BuildContext context) {

//     final productBloc = BlocProvider.of<ProductBloc>(context); 
    
//     return Scaffold(
//       bottomNavigationBar: const CheckoutCard(),
//       body: Container( padding:
//           EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//       child: ListView.builder(
//         itemCount: demoCarts.length,
//         itemBuilder: (context, index) => Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Dismissible(
//             key: Key(demoCarts[index].product.id.toString()),
//             direction: DismissDirection.endToStart,
//             onDismissed: (direction) {
//               setState(() {
//                 demoCarts.removeAt(index);
//               });
//             },
//             background: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFE6E6),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 children: [
//                   const Spacer(),
//                   SvgPicture.asset("assets/icons/Trash.svg"),
//                 ],
//               ),
//             ),
//             child: CartCard(cart: demoCarts[index]),
//           ),
//         ),
//       ),
//       ),
//     );
//   }
// }
