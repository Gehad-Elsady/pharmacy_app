import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:pharmacy_app/components/my_button.dart';
import 'package:pharmacy_app/model/medicine.dart';
// import 'package:pharmacy_app/model/pharmacy.dart';
import 'package:pharmacy_app/services/auth/auth_services.dart';
// import 'package:provider/provider.dart';

class MedicinePage extends StatefulWidget {
  final Medicine food;
  MedicinePage({Key? key, required this.food}) : super(key: key);

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  FirebaseFirestore firestore =
      FirebaseFirestore.instance; // Initialize Firestore
  late String? currentUserEmail;

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
          // Update the email variable with the current user's email
          currentUserEmail = currentUser.email ?? '';
        });
      }
    } catch (e) {
      print('Error getting current user: $e');
    }
  }

  void addToCart(Medicine food) async {
    // Create a map with item details including the 'gogo' field
    Map<String, dynamic> orderData = {
      'name': food.name,
      'price': food.price,
      'imageUrl': food.imageUrl,
      // Add any other properties of the Medicine class here
    };

    // Reference to the Firestore collection 'Orders'
    final orderRef = firestore.collection('Orders').doc(currentUserEmail);

    // Set the 'gogo' field in the document with the value
    await orderRef.set({
      'gogo': 'the order data',
      // 'address': address,
      // 'city': city,
      // 'governorate': governorate,
      'OrdeTime': DateTime.now(),
    }, SetOptions(merge: true));

    // Add item details to subcollection 'Items'
    await orderRef.collection('Items').add(orderData);

    Navigator.pop(context);
    // context.read<Pharmacy>().addToCart(food);
  }

  // Access the fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey[100]!],
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(widget.food.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '\$${widget.food.price}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.teal[900],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyButton(
                      "Add to Cart",
                      ontap: () => addToCart(widget.food),
                      icon: Icons.shopping_cart_outlined,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
