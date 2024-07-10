import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/components/my_button.dart';
import 'package:pharmacy_app/services/auth/auth_gete.dart';
// import 'dart:html' as html;

class WlcomePage extends StatelessWidget {
  const WlcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'images/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm0zNzNiYXRjaDE1LTIxNy0wMS5qcGc.webp'),
                  fit: BoxFit
                      .cover, // Adjusts the image size to cover the entire container
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // logo and slogen
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 50),
                          width: 300,
                          height: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/Pharmacy-logo-on-transparent-PNG-removebg-preview.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const Text(
                          "Welcome to E-pharmacy",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "We are here to to make your live esyer",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //button for the welcome screen
                    MyButton("Login", ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthGate(),
                          ));
                    }, icon: Icons.login_outlined),
                    SizedBox(
                      height: 180,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("We will add it soon 🔜"),
                              ),
                            );
                          },
                          icon: FaIcon(FontAwesomeIcons.facebook),
                          color: Colors.blue,
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("We will add it soon 🔜"),
                              ),
                            );
                          },
                          icon: FaIcon(FontAwesomeIcons.xTwitter),
                          color: Colors.black,
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("We will add it soon 🔜"),
                              ),
                            );
                          },
                          icon: FaIcon(FontAwesomeIcons.instagram),
                          color: Color.fromARGB(255, 200, 6, 90),
                          iconSize: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("We will add it soon 🔜"),
                              ),
                            );
                          },
                          icon: FaIcon(FontAwesomeIcons.whatsapp),
                          color: Colors.green, // Adjust color as needed
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
