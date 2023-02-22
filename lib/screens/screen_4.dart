import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => Screen4State();
}

class Screen4State extends State<Screen4> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Container(
            height: 40,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    // Action lorsque la flèche est cliquée
                  },
                ),
                const Text(
                  " Trouvez un magasin proche",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container()
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Nom de magazin 1 ...",
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  // Code pour la fonction de recherche ici
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      child: Text(
                                        "Nom de magazin 1",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        top: 10.0,
                                      ),
                                      child: Text(
                                        "Nom de magazin 1, Tunis Km 128\n4000 Sousse",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10.0, left: 50),
                                      child: Row(
                                        children: <Widget>[
                                          ElevatedButton(
                                            onPressed: () {
                                              // Action à effectuer lorsque le bouton est cliqué
                                            },
                                            child: const Text(
                                              "Horaire",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 150.0),
                                            child: Text(
                                              "100 Km",
                                              style: TextStyle(
                                                color: Colors.blue[500],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            child: Text(
                                              "Nom de magazin 1",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                              top: 10.0,
                                            ),
                                            child: Text(
                                              "Nom de magazin 1, Tunis Km 128\n4000 Sousse",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10.0, left: 50),
                                            child: Row(
                                              children: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Action à effectuer lorsque le bouton est cliqué
                                                  },
                                                  child: const Text(
                                                    "Horaire",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 150.0),
                                                  child: Text(
                                                    "100 Km",
                                                    style: TextStyle(
                                                      color: Colors.blue[500],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            child: Text(
                                              "Nom de magazin 1",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                              "Nom de magazin 1, Tunis Km 128\n4000 Sousse",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10.0, left: 50),
                                            child: Row(
                                              children: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () {
                                                    // Action à effectuer lorsque le bouton est cliqué
                                                  },
                                                  child: const Text(
                                                    "Horaire",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 150.0),
                                                  child: Text(
                                                    "100 Km",
                                                    style: TextStyle(
                                                      color: Colors.blue[500],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                            child: const Text(
                              "Choisir ce magasin",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            onPressed: () {
                              // Action lorsque le bouton est cliqué
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
