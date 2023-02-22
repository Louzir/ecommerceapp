import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/splash_screen/select_image.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  final screens = const [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: Column(),
      // ),
      // appBar: AppBar(
      //   elevation: 0,
      //   actions: const [
      //     Icon(
      //       Icons.shopping_basket,
      //     ),
      //     SizedBox(width: 20),
      //     Icon(
      //       Icons.search,
      //     )
      //   ],
      //   centerTitle: true,
      //   title: const Text(
      //     "ECommerce App",
      //     style: TextStyle(
      //       fontSize: 14,
      //     ),
      //   ),
      // ),
      body: PageView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return screens[index];
        },
      ),
      // body: Container(
      //   width: MediaQuery.of(context).size.width,
      //   child: Column(
      //     children: [
      //       CircleAvatar(
      //         radius: 32,
      //         child: Icon(Icons.person),
      //       ),
      //       Container(
      //         height: 80,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           color: Colors.orangeAccent,
      //           borderRadius: BorderRadius.all(
      //             Radius.circular(12),
      //           ),
      //         ),
      //         child: Text("data"),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              children: <Widget>[
                // Buttons
                Row(
                  children: <Widget>[
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text('<'),
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                        )),

                    Expanded(
                      child: Image(
                        image: const AssetImage("assets/magasin.png"),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.height / 2,
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    // },

                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 32,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Scannez, Payez & Profitez!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    'Scannez les produits que vous \n souhaitez acheter dans votre magasin \n préféré.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Payez par téléphone.\n Un shopping agréable et convivial!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen3()),
                      );
                    },
                    child: const Text(
                      'Passer',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              children: <Widget>[
                // Buttons
                Row(
                  children: <Widget>[
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text('<'),
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                        )),

                    Expanded(
                      child: Image(
                        image: const AssetImage("assets/magasin.png"),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.height / 2,
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text('>'),
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 32,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Scannez, Payez & Profitez!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    'Scannez les produits que vous \n souhaitez acheter dans votre magasin \n préféré.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Payez par téléphone.\n Un shopping agréable et convivial!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen3()),
                      );
                    },
                    child: const Text(
                      'Passer',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Column(
              children: <Widget>[
                // Buttons
                Row(
                  children: <Widget>[
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text('<'),
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                        )),

                    Expanded(
                      child: Image(
                        image: const AssetImage("assets/magasin.png"),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.height / 2,
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text('>'),
                    // ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 32,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Scannez, Payez & Profitez!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                    'Scannez les produits que vous \n souhaitez acheter dans votre magasin \n préféré.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    'Payez par téléphone.\n Un shopping agréable et convivial!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Screen3()),
                      );
                    },
                    child: const Text(
                      'Passer',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
