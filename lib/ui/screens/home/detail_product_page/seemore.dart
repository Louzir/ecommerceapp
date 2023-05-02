import 'package:flutter/material.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({
    super.key, required this.title, required this.pressSeeAll,
  });
  final String title;
  final VoidCallback pressSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
      children: [
        Text(title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color : Colors.black,
          fontWeight: FontWeight.w600,
        ),),
        TextButton(onPressed: pressSeeAll,
        child: const Text("See More", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),),),
      ],
    );
  }
}
