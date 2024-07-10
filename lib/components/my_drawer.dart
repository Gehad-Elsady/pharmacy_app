import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_app/components/my_drawer_tile.dart';
import 'package:pharmacy_app/pages/user_info_page.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void loguot() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _authServices = AuthServices();
    _authServices.signout();
    // Navigate to the initial route after logout
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  late String? currentUserEmail = '';

  @override
  void initState() {
    super.initState();
    // Fetch the current user's details when the widget initializes
    fetchCurrentUser();
    // getNameFromFirestore();
  }

  void fetchCurrentUser() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _authService = AuthServices();
    // ignore: await_only_futures
    User? currentUser = await _authService.getCurrentUser();
    try {
      if (currentUser != null) {
        setState(() {
          // Update the email variable with the current user's email
          currentUserEmail = currentUser.email ?? '';
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error getting current user: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            // ignore: prefer_const_constructors
            accountName: Text(""), // Replace with actual name
            accountEmail: Text(currentUserEmail!), // Replace with actual email
            currentAccountPicture: const Icon(
              Icons.person,
              color: Colors.black,
              size: 70,
            ),
            decoration: const BoxDecoration(
              color: Colors.teal,
            ),
          ),
          MyDrawerTile(
              "M Y P R O F I L E",
              Icons.person,
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UsersInfo(),
                  ))),
          const Spacer(),
          MyDrawerTile("L O G O U T", Icons.logout, loguot),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
