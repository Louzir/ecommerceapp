import 'package:flutter/material.dart';
import '../../components/navigbar.dart';
import '../../components/enums.dart';
import '../../components/size_config.dart';
import '../Home/home.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});
  static String routeName = "/paymentsuccess";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.panier),
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Payment confirmation',
          style: TextStyle(color: Colors.black),
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
              'Payment successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Your payment has been made successfully.',
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
                'See the details',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: getProportionateScreenWidth(300),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
                //color: Colors.red,
                child: const Text('Download the invoice'),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(300),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(const BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () => Navigator.pushNamed(context, Home.routeName),
                child: const Text('Shop more'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
