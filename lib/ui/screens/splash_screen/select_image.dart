import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_ecommerce_app/ui/screens/home/home.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);
  static String routeName = "/select-img";
  @override
  State<Screen3> createState() => Screen3State();
}

class Screen3State extends State<Screen3> {
  bool _image1Selected = false;
  bool _image2Selected = false;

  void _selectImage1() {
    setState(() {
      _image1Selected = true;
      _image2Selected = false;
    });
  }

  void _selectImage2() {
    setState(() {
      _image1Selected = false;
      _image2Selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(100)),
          Container(
            width: getProportionateScreenWidth(300),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Dites-nous comment vous l’aimeriez',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            child: Text(
              'Merci de choisir le service qui \n vous convient',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(65),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectImage1();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: Stack(
                            children: <Widget>[
                              Image(
                                image:
                                    const AssetImage("assets/liv_domicile.png"),
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.height / 5,
                              ),
                              if (_image1Selected)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 22,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectImage2();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Stack(
                            children: <Widget>[
                              Image(
                                image: const AssetImage("assets/liv.png"),
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.height / 5,
                              ),
                              if (_image2Selected)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 22,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'livraison à\n domicile',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(width: 110),
                      Text(
                        'Retrait en \n magasin',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: getProportionateScreenWidth(300),
                  height: getProportionateScreenHeight(40),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                    onPressed: () {
                      // Action à faire lorsque le bouton gauche est cliqué
                    },
                    child: const Text('Terminer'),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: getProportionateScreenWidth(300),
                  height: getProportionateScreenHeight(40),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      )),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, Home.routeName),
                    child: const Text('Pas maintenant'),
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
