import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Confirmation de paiement',
          style: TextStyle(color: Colors.black45),
        ),
        backgroundColor: Colors.white,
        //iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ), // icône à utiliser
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/P_reussi.png'),
            /*const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),*/
            const SizedBox(height: 20),
            const Text(
              'Paiement réussi!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Votre paiement a été effectué avec succès.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                //code
              },
              child: const Text(
                'Voir les détails',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
                //color: Colors.red,
                child: const Text('Téléchager la facture'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
