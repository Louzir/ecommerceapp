import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/components/size_config.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/navigbar.dart';
import '../../components/enums.dart';
import '../home/home.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});
  static String routeName = "/strore";
  @override
  State<Screen4> createState() => Screen4State();
}

class Screen4State extends State<Screen4> {
  bool showTimeRange1 = false;
  bool showTimeRange2 = false;
  bool showTimeRange3 = false;
  bool showTimeRange4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigBar(selectedMenu: MenuState.store),
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Find a nearby store',
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(11),
                      hintText: "Research...",
                      hintStyle: const TextStyle(fontSize: 12),
                      filled: true,
                      fillColor: Colors.white,
                      border: outlineInputBorder,
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/Search.svg"),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // add onTap callback
                  },
                  child: Container(
                    width: 80,
                    height: 55,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xff4d6aee),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.map,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: showTimeRange1
                        ? 226
                        : 113, // update the height based on whether the widget is expanded or not
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Louzir store",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "louzir store, Jemmel \n5020 Monastir",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                  ),
                                ),
                                IconButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(showTimeRange1
                                        ? Icons.keyboard_arrow_up
                                        : Icons
                                            .keyboard_arrow_down), // update the icon based on whether the widget is expanded or not
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showTimeRange1 =
                                          !showTimeRange1; // toggle the _isExpanded boolean variable
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "37 Km",
                              style: TextStyle(
                                color: Colors.blue[500],
                              ),
                            ),
                            // ),
                          ],
                        ),
                        if (showTimeRange1) // show the expanded content if _isExpanded is true
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "9:00 am - 12:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "1:00 pm - 6:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 400,
                    height: showTimeRange2
                        ? 226
                        : 113, // update the height based on whether the widget is expanded or not
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Charrada store",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "Charrada store, Jemmel \n5020 Monastir",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                  ),
                                ),
                                IconButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(showTimeRange2
                                        ? Icons.keyboard_arrow_up
                                        : Icons
                                            .keyboard_arrow_down), // update the icon based on whether the widget is expanded or not
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showTimeRange2 =
                                          !showTimeRange2; // toggle the _isExpanded boolean variable
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "40 Km",
                              style: TextStyle(
                                color: Colors.blue[500],
                              ),
                            ),
                            // ),
                          ],
                        ),
                        if (showTimeRange2) // show the expanded content if _isExpanded is true
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "9:00 am - 12:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "1:00 pm - 6:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 400,
                    height: showTimeRange3
                        ? 226
                        : 113, // update the height based on whether the widget is expanded or not
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Borgiphone",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "BorgiPhone, Khzema \n4000 Sousse",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                  ),
                                ),
                                IconButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(showTimeRange3
                                        ? Icons.keyboard_arrow_up
                                        : Icons
                                            .keyboard_arrow_down), // update the icon based on whether the widget is expanded or not
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showTimeRange3 =
                                          !showTimeRange3; // toggle the _isExpanded boolean variable
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "57 Km",
                              style: TextStyle(
                                color: Colors.blue[500],
                              ),
                            ),
                            // ),
                          ],
                        ),
                        if (showTimeRange3) // show the expanded content if _isExpanded is true
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "9:00 am - 12:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "1:00 pm - 6:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 400,
                    height: showTimeRange4
                        ? 226
                        : 113, // update the height based on whether the widget is expanded or not
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Peak",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "Peak, Mall of Sousse\n4000 Sousse",
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                    color: Colors.blue[500],
                                  ),
                                ),
                                IconButton(
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(showTimeRange4
                                        ? Icons.keyboard_arrow_up
                                        : Icons
                                            .keyboard_arrow_down), // update the icon based on whether the widget is expanded or not
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showTimeRange4 =
                                          !showTimeRange4; // toggle the _isExpanded boolean variable
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "64 Km",
                              style: TextStyle(
                                color: Colors.blue[500],
                              ),
                            ),
                            // ),
                          ],
                        ),
                        if (showTimeRange4) // show the expanded content if _isExpanded is true
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "9:00 am - 12:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "1:00 pm - 6:00 pm",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 15),
                  // Container(
                  //   width: 400,
                  //   height: showTimeRange3
                  //       ? 226
                  //       : 113, // update the height based on whether the widget is expanded or not
                  //   padding: const EdgeInsets.only(left: 60, right: 60),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         "City watch",
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15.0,
                  //         ),
                  //       ),
                  //       Text(
                  //         "City watch, Mall of Sousse \n4000 Sousse",
                  //         style: TextStyle(
                  //           color: Colors.grey[500],
                  //         ),
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: <Widget>[
                  //           Row(
                  //             children: [
                  //               Text(
                  //                 "Time",
                  //                 style: TextStyle(
                  //                   color: Colors.blue[500],
                  //                 ),
                  //               ),
                  //               IconButton(
                  //                 icon: Padding(
                  //                   padding: const EdgeInsets.only(right: 10),
                  //                   child: Icon(showTimeRange3
                  //                       ? Icons.keyboard_arrow_up
                  //                       : Icons
                  //                           .keyboard_arrow_down), // update the icon based on whether the widget is expanded or not
                  //                 ),
                  //                 onPressed: () {
                  //                   setState(() {
                  //                     showTimeRange3 =
                  //                         !showTimeRange3; // toggle the _isExpanded boolean variable
                  //                   });
                  //                 },
                  //               ),
                  //             ],
                  //           ),
                  //           Text(
                  //             "64 Km",
                  //             style: TextStyle(
                  //               color: Colors.blue[500],
                  //             ),
                  //           ),
                  //           // ),
                  //         ],
                  //       ),
                  //       if (showTimeRange3) // show the expanded content if _isExpanded is true
                  //         Padding(
                  //           padding: const EdgeInsets.only(left: 30, top: 10),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "9:00 am - 12:00 pm",
                  //                 style: TextStyle(
                  //                   color: Colors.grey[500],
                  //                 ),
                  //               ),
                  //               const SizedBox(height: 10),
                  //               Text(
                  //                 "1:00 pm - 6:00 pm",
                  //                 style: TextStyle(
                  //                   color: Colors.grey[500],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(300),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                      //color: Colors.red,
                      child: const Text('Choose this store'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ],
    );
  }
}
