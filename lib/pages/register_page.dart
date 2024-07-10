import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/my_button.dart';
import 'package:pharmacy_app/components/my_textfilde.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? rool;

  String? validateEmail(String value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    List<String> emailParts = value.split('@');
    String domain = emailParts[1];
    List<String> domainParts = domain.split('.');
    if (domainParts.length < 2 || domainParts.last.length < 2) {
      return 'Enter a valid email address';
    }

    if (domain != 'gmail.com' &&
        domain != 'yahoo.com' &&
        domain != "outlook.com" &&
        domain != "icloud.com") {
      return 'Only gmail.com,yahoo.com,icloud.com and outlook.com are allowed!';
    }

    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8 || !value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Password must be at least 8 characters long and contain at least one letter.';
    }
    return null;
  }

  void register() async {
    final _authService = AuthServices();
    final String? emailError = validateEmail(emailController.text);
    final String? passwordError = validatePassword(passwordController.text);

    if (rool == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Please choose your role",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      );
      return;
    }

    if (emailError != null || passwordError != null) {
      String errorMessage = emailError ?? '';
      if (passwordError != null) {
        errorMessage += '\n' + passwordError;
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            errorMessage,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      );
      return;
    }

    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _authService.signupWithEmailPassword(
            emailController.text, passwordController.text, rool!);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Passwords do not match",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      );
    }
  }

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
                      'images/pharmacy-foreground-with-counter-blurred-backdrop-medicine-shelves-emphasizing-recycled-plastic-bottle-usage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_open_rounded,
                    size: 100,
                    color: Colors.black,
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Let's create a new account for you",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: rool == "Pharmacy"
                              ? MaterialStateProperty.all(Colors.green)
                              : MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          setState(() {
                            rool = "Pharmacy";
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.admin_panel_settings_rounded,
                                size: 50,
                              ),
                              Text(
                                "Pharmacy",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: rool == "User"
                              ? MaterialStateProperty.all(Colors.green)
                              : MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          setState(() {
                            rool = "User";
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.person_2_rounded,
                                size: 50,
                              ),
                              Text(
                                "User",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextFilde(
                    emailController,
                    "Email",
                    false,
                    Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  MyTextFilde(
                    passwordController,
                    "Password",
                    true,
                    Icon(
                      Icons.key_rounded,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  MyTextFilde(
                    confirmPasswordController,
                    "Confirm password",
                    true,
                    Icon(
                      Icons.password_rounded,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 25),
                  MyButton(
                    ontap: register,
                    "Sign up",
                    icon: Icons.login,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already have an account?  ",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 96, 79, 79),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Login now",
                          style: TextStyle(
                            color: Colors.blueAccent.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
