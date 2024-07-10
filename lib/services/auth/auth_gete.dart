import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_app/pages/home_page.dart';
import 'package:pharmacy_app/pages/orders_page.dart';
import 'package:pharmacy_app/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            String userEmail = snapshot.data!.email!;
            return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance
                  .collection('Roles')
                  .doc(userEmail) // Use user's email as document ID
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      roleSnapshot) {
                if (roleSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (roleSnapshot.hasData && roleSnapshot.data!.exists) {
                  Map<String, dynamic> data = roleSnapshot.data!.data()!;
                  String? role = data['role'] as String?;
                  if (role == 'User') {
                    return HomePage();
                  } else {
                    return OrdersPage();
                  }
                } else {
                  // If the user document doesn't exist or role field is missing
                  // You can handle this case as per your requirement
                  return Scaffold(
                    body: Center(
                      child: Text("Error: User data not found."),
                    ),
                  );
                }
              },
            );
          } else {
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
