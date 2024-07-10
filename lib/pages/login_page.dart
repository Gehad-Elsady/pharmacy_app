import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/my_button.dart';
import 'package:pharmacy_app/components/my_textfilde.dart';
import 'package:pharmacy_app/pages/welcome_page.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? ontap;

  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  String? rool;

  void login() async {
    final _authService = AuthServices();
    try {
      await _authService.signinWithEmailPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      String errorMessage = "Incorrect password or email";
      if (e is FirebaseAuthException) {
        if (e.code == "wrong-password") {
          errorMessage = "Incorrect password.";
        }
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(errorMessage),
        ),
      );
    }
  }

  void forgotpw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("User tapped forgot password"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'images/thermometer-with-high-temperature-pills.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0, left: 35),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WlcomePage(),
                                ));
                          },
                          icon: Icon(
                            Icons.home_rounded,
                            size: 40,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
                // logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 100,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 25,
                ),
                //massege
                Text(
                  "Welcome to E-pharmacy",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                ),
                //email
                MyTextFilde(
                    emailController,
                    "Email",
                    false,
                    Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    )),
                SizedBox(height: 15),
                //password
                MyTextFilde(
                    passwordController,
                    "Password",
                    true,
                    Icon(
                      Icons.key_rounded,
                      color: Colors.black,
                    )),
                SizedBox(height: 25),
                //sing in
                MyButton(ontap: login, "Sign in", icon: Icons.login),
                SizedBox(height: 8),
                //sing up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Register now",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
