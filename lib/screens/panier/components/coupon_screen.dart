import 'package:flutter/material.dart';

import '../../../components/size_config.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 200,
          width: getProportionateScreenWidth(300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Entrer le code coupon',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code coupon',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
                onPressed: () {
                  // Faites quelque chose lorsque le bouton est cliqué, par exemple, fermer l'écran flottant.
                  Navigator.of(context).pop();
                },
                child: const Text('Appliquer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
