import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy_app/pages/pharmacy_order.dart';
import 'package:pharmacy_app/pages/user_info_page.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';

class OrdersPage extends StatefulWidget {
  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late String? currentUserEmail = '';
  late String? currentUserCity = '';

  @override
  void initState() {
    super.initState();
    fetchCurrentUser();
  }

  void fetchCurrentUser() async {
    final _authService = AuthServices();
    User? currentUser = await _authService.getCurrentUser();
    try {
      if (currentUser != null) {
        setState(() {
          currentUserEmail = currentUser.email ?? '';
        });
        // Fetch the city of the current user from the User collection
        fetchUserCity(currentUserEmail);
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  void fetchUserCity(String? email) async {
    if (email != null) {
      final userDoc =
          await FirebaseFirestore.instance.collection('Users').doc(email).get();
      setState(() {
        currentUserCity = userDoc['city'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UsersInfo(),
                    ));
              },
              icon: Icon(Icons.person_2_rounded)),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PharmacyOrderPage(),
                    ));
              },
              child: Text("My Orders")),
          IconButton(
              onPressed: () {
                final _authServices = AuthServices();
                _authServices.signout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              icon: Icon(Icons.logout_rounded))
        ],
        title: Text('Orders'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Pharmacy')
            .where('city', isEqualTo: currentUserCity)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot pharmacyDoc) {
              final address = pharmacyDoc['address'] ?? '';
              final city = pharmacyDoc['city'] ?? '';
              final governorate = pharmacyDoc['governorate'] ?? '';
              final orderState = pharmacyDoc['order_state'] ?? '';
              final phone = pharmacyDoc['phone'] ?? '';
              final email = pharmacyDoc['userId'] ?? '';

              final items =
                  List<Map<String, dynamic>>.from(pharmacyDoc['items'] ?? []);

              // Calculate total price
              double totalPrice =
                  items.fold(0, (prev, item) => prev + (item['price'] ?? 0));

              return Card(
                margin: EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: Text('User ID: $email'), // Pharmacy ID as title
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone number: $phone'),
                        Text('Address: $address'),
                        Text('City: $city'),
                        Text('Governorate: $governorate'),
                        Text('Order State: $orderState'),
                        SizedBox(height: 8.0),
                        // Show the items
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: items.map((item) {
                            final name = item['name'] ?? '';
                            final price = item['price'] ?? '';
                            final image = item['imageUrl'] ?? '';

                            return Card(
                              elevation: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        height: 150,
                                        child: Image.asset(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Name: $name'),
                                          Text('Price: $price'),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 8.0),
                        // Show total price
                        Text(
                          'Total Price: $totalPrice',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (orderState == 'pending')
                              ElevatedButton(
                                onPressed: () async {
                                  // Add a new document to the 'Notifications' collection
                                  String userId = pharmacyDoc['userId'] ??
                                      ''; // Get the user ID
                                  await FirebaseFirestore.instance
                                      .collection('Notifications')
                                      .doc(
                                          userId) // Set the document ID as the user ID
                                      .set({
                                    'message':
                                        'Your order is accepted Order will delivered  after 45m',
                                  });

                                  // Update order state to 'accepted' in the Pharmacy collection
                                  await FirebaseFirestore.instance
                                      .collection('Pharmacy')
                                      .doc(pharmacyDoc.id)
                                      .update({
                                    'order_state': 'accepted',
                                    'businessId':
                                        currentUserEmail, // Add the businessId field with the current user's email
                                  });
                                },
                                child: Text("Accept"),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
